using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using LangTool_ASP.NET_Web_API.Models;

namespace LangTool_ASP.NET_Web_API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class TestsController : ControllerBase
    {
        private readonly Context db;

        public TestsController(Context context)
        {
            db = context;
        }

        // GET: Tests
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Test>>> GetTests()
        {
            return await db.Tests.ToListAsync();
        }


        [HttpGet("{TestName}")]
        public async Task<ActionResult<Test>> Get(string testName)
        {
            Test test = await db.Tests.FirstOrDefaultAsync(x => x.TestName == testName);
            if (test == null)
                return NotFound();
            return new ObjectResult(test);
        }

        //[HttpGet("test/test/test/{testName}/{dos}")]
        //public async Task<ActionResult<IEnumerable<TestUser>>> GetTests(string testName, string dos)
        //{
        //    return await db.TestUsers
        //       .Include(testUser => testUser.Test)
        //       .Include(testUser => testUser.User)
        //       .Where(testUser => testUser.Test.Test_id == 1 &&
        //                   testUser.User.User_id == 1)
        //       .ToListAsync();
        //}

        // Проверка теста.
        [HttpPost("checkTest/{TestName}/{User_id}")]
        public async Task<ActionResult<object>> CheckTest(string testName, int user_id, string[] answers)
        {
            var checkUser = db.Users.FirstOrDefault(u => u.User_id == user_id);
            if (checkUser == null) return NoContent();

            Test receivedTest = await db.Tests.FirstOrDefaultAsync(x => x.TestName == testName);

            var questions = await db.Questions
                .Include(quest => quest.Tests)
                .Where(quest => quest.Tests.Select(test => test.TestName).Contains(testName)).ToListAsync();

            float testMark = 0;
            int correctAnswers = 0;
            int answersCounter = 0;
            bool isFirstPass = true;


            var checkTest = db.TestUsers
                        .Include(testUser => testUser.Test)
                        .Include(testUser => testUser.User)
                        .Count(testUser => testUser.Test.Test_id == receivedTest.Test_id &&
                            testUser.User.User_id == user_id);

           // Проверка на наличие предыдущей сдачи.
            if (checkTest == 0)
            {
                db.TestUsers.Add(new TestUser
                {
                    Test_id = receivedTest.Test_id,
                    User_id = user_id,
                    IsEnabled = true,
                    CurrentMark = 0
                });
            }
            else isFirstPass = false;

            // Проверка вопросов.
            for (int i = 0; i < questions.Count; i++)
            {
                var currentQuestion = questions[i];

                var answersDB = await db.Answers
                .Include(answ => answ.Question)
                .Where(answ => answ.Question.Any(quest => quest.Question_id == questions[i].Question_id))
                .ToListAsync();


                // Проверка вариантов ответов.
                for (int j = 0; j < answersDB.Count; j++)
                {                    

                    if (answersDB[j].CorrectAnswer == answers[answersCounter])
                    {
                        correctAnswers++;
                        float test1 = questions[i].Multiplyer;
                        float test2 = answersDB[j].Mark;
                        testMark += questions[i].Multiplyer * answersDB[j].Mark;
                        answersCounter++;
                    }
                }

            }

            var temp = await db.TestUsers
               .Include(testUser => testUser.Test)
               .Include(testUser => testUser.User)
               .Where(testUser => testUser.Test.Test_id == receivedTest.Test_id &&
                    testUser.User.User_id == user_id)
               .ToListAsync();

            var testUserBefore = temp[0];
            if (testUserBefore.CurrentMark < testMark)
            {
                // Give Achievement.            
            var achievementUser = db.AchievementUsers
               .Include(achievement => achievement.Achievement)
               .Include(user => user.User)
               .Where(achievementUser => achievementUser.User_id == user_id)
               .FirstOrDefault(achievementUser => achievementUser.Achievement.Name == testName);
            var getById = db.Achievements.FirstOrDefault(t => t.Name == testName);

                if (achievementUser == null)
                {
                    db.AchievementUsers.Add(new AchievementUser()
                    {
                        Achievement_id = getById.Achievement_id,
                        User_id = user_id
                    });
                    var userT = db.Users.FirstOrDefault(user => user.User_id == user_id);
                    userT.Gained_achievements++;
                    db.Entry(userT).State = EntityState.Modified;
                }
            }
            testUserBefore.CurrentMark = testMark;
            db.Entry(testUserBefore).State = EntityState.Modified;
            if (isFirstPass)
            {
                var user = testUserBefore.User;
                user.Passed_tests++;
                db.Entry(user).State = EntityState.Modified;
            }

            // Give Achievement.
            var result = db.AchievementUsers
               .Include(achievement => achievement.Achievement)
               .Include(user => user.User)
               .Where(achievementUser => achievementUser.User_id == user_id)
               .FirstOrDefault(achievementUser => achievementUser.Achievement.Name.Contains(testName));
            var getId = db.Achievements.FirstOrDefault(t => t.Name.Contains(testName));

            if (result == null)
            {
                db.AchievementUsers.Add(new AchievementUser()
                {
                    Achievement_id = getId.Achievement_id,
                    User_id = user_id
                });
                var user = db.Users.FirstOrDefault(user => user.User_id == user_id);
                user.Gained_achievements++;
                db.Entry(user).State = EntityState.Modified;
            }
            

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TestUserExists(testUserBefore.TestUser_id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            //return NoContent();
            return new
            {
                totalMark = receivedTest.TotalMark,
                currentMark = testMark,
                correctUserAnswers = correctAnswers
            };
        }


        private bool TestExists(int id)
        {
            return db.Tests.Any(e => e.Test_id == id);
        }

        private bool TestUserExists(int id)
        {
            return db.TestUsers.Any(e => e.User_id == id);
        }

        #region OtherRequests
        //// GET: Tests/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<Test>> GetTest(int id)
        //{
        //    var test = await db.Tests.FindAsync(id);

        //    if (test == null)
        //    {
        //        return NotFound();
        //    }

        //    return test;
        //}

        //// PUT: Tests/5
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutTest(int id, Test test)
        //{
        //    if (id != test.Test_id)
        //    {
        //        return BadRequest();
        //    }

        //    db.Entry(test).State = EntityState.Modified;

        //    try
        //    {
        //        await db.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!TestExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}

        //// POST: Tests
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        //public async Task<ActionResult<Test>> PostTest(Test test)
        //{
        //    db.Tests.Add(test);
        //    await db.SaveChangesAsync();

        //    return CreatedAtAction("GetTest", new { id = test.Test_id }, test);
        //}

        //// DELETE: Tests/5
        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteTest(int id)
        //{
        //    var test = await db.Tests.FindAsync(id);
        //    if (test == null)
        //    {
        //        return NotFound();
        //    }

        //    db.Tests.Remove(test);
        //    await db.SaveChangesAsync();

        //    return NoContent();
        //}
        #endregion
    }
}
