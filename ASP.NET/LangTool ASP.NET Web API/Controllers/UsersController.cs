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
    public class UsersController : ControllerBase
    {
        private readonly Context db;

        public UsersController(Context context)
        {
            db = context;

            if (!db.Users.Any())
            {
                db.Users.Add(new User { Name = "Tom", Email = "Tom@gna", Password = "Qwerty" });
                db.Users.Add(new User { Name = "Alice", Email = "secondemaul@gna", Password = "12Qwerty" });
                db.SaveChanges();
            }
            if (!db.Tests.Any())
            {
                db.Tests.Add(new Test { TestName = "Food", TotalMark = 100 });
                db.Tests.Add(new Test { TestName = "Daily", TotalMark = 200 });
                db.SaveChanges();
            }
            if (!db.Achievements.Any())
            {
                db.Achievements.Add(new Achievement { Name = "Do it!", Description = "Finish the 1st stage" });
                db.Achievements.Add(new Achievement { Name = "Do it x2!", Description = "Finish the 2nd stage" });
                db.SaveChanges();
            }
            if (!db.Phrases.Any())
            {
                db.Phrases.Add(new Phrase { TopicName = "Food", PhraseName = "Banana" });
                db.Phrases.Add(new Phrase { TopicName = "Daily", PhraseName = "Hello" });
                db.SaveChanges();
            }
            if (!db.Questions.Any())
            {
                db.Questions.Add(new Question { QuestionName = "Where are u from?", Multiplyer = 1 });
                db.Questions.Add(new Question { QuestionName = "How old are you?", Multiplyer = 2 });
                db.SaveChanges();
            }
            //if (!db.TestQuestion.Any())
            //{
            //    db.TestQuestion.Add(new TestQuestion { Question_id = 1, Test_id = 1 });
            //    db.TestQuestion.Add(new TestQuestion { Question_id = 2, Test_id = 1 });
            //    db.SaveChanges();
            //}
            if (!db.TestUsers.Any())
            {
                db.TestUsers.Add(new TestUser { User_id = 1, Test_id = 1, IsEnabled = false, CurrentMark = 0 });
                db.TestUsers.Add(new TestUser { User_id = 2, Test_id = 1, IsEnabled = true, CurrentMark = 100 });
                db.SaveChanges();
            }
            //if (!db.Answers.Any()) {
            //    db.Answers.Add(new Answer { Answer_id = 1, CorrectAnswer = "a)", Mark = 5 });
            //    db.Answers.Add(new Answer { Answer_id = 2, CorrectAnswer = "b)", Mark = 0 });
            //}
        }

        // GET: Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            return await db.Users.ToListAsync();
        }

        [HttpGet("{Email}")]
        public async Task<ActionResult<User>> Get(string email)
        {
            User user = await db.Users.FirstOrDefaultAsync(x => x.Email == email);
            if (user == null)
                return NotFound();
            return new ObjectResult(user);
        }

        // PUT: Users/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser(int id, User user)
        {
            if (id != user.User_id)
            {
                return BadRequest();
            }

            db.Entry(user).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: Users
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        //public async Task<ActionResult<User>> PostUser(User user)
        //{
        //    db.Users.Add(user);
        //    await db.SaveChangesAsync();

        //    return CreatedAtAction("GetUser", new { id = user.User_id }, user);
        //}
        // POST users
        [HttpPost]
        public async Task<ActionResult<User>> Post(User user)
        {
            if (user == null)
            {
                return BadRequest();
            }

            db.Users.Add(user);
            await db.SaveChangesAsync();
            return Ok(user);
        }


        // DELETE users/{email}
        [HttpDelete("{Email}")]
        public async Task<ActionResult<User>> Delete(string email)
        {
            User user = db.Users.FirstOrDefault(x => x.Email == email);
            if (user == null)
            {
                return NotFound();
            }
            db.Users.Remove(user);
            await db.SaveChangesAsync();
            return Ok(user);
        }

        private bool UserExists(int id)
        {
            return db.Users.Any(e => e.User_id == id);
        }
    }
}
