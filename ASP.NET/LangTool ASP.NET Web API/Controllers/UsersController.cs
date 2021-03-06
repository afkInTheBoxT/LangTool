using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using LangTool_ASP.NET_Web_API.Models;
using System.Web.Http.Cors;
using System.IO;

namespace LangTool_ASP.NET_Web_API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [Route("[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly Context db;

        public UsersController(Context context)
        {
            db = context;

            DbInit.InitializeData(db);
        }

        // GET: Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            return await db.Users.ToListAsync();
        }

        // GET: Users/{Email}
        [HttpGet("{Email}")]
        public async Task<ActionResult<User>> Get(string email)
        {
            User user = await db.Users.FirstOrDefaultAsync(x => x.Email == email);
            if (user == null)
                return NotFound();
            return new ObjectResult(user);
        }

        // PUT: Users/5
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
        [HttpPost]
        public async Task<ActionResult<User>> Post(User user)
        {
            if (user == null)
            {
                return BadRequest();
            }
            user.date_of_registration = DateTime.Now;
            db.Users.Add(user);
            await db.SaveChangesAsync();

            // Give Achievement.
            var getId = db.Achievements.FirstOrDefault(t => t.Name.Contains("Перший дзвоник"));
            db.AchievementUsers.Add(new AchievementUser()
            {
                Achievement_id = getId.Achievement_id,
                User_id = user.User_id
            });
            user.Gained_achievements++;
            db.Entry(user).State = EntityState.Modified;

            await db.SaveChangesAsync();

            return Ok(user);
        }

        // DELETE Users/{email}
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

        // GET: Users/deadlines/{id}
        [HttpGet("deadlines/{user_id}")]
        public async Task<ActionResult<IEnumerable<Deadline>>> GetUserDeadlines(int user_id)
        {
            return await db.Deadlines.Where(deadline => deadline.User.User_id == user_id).ToListAsync();
        }

        // POST: Users/deadlines/{id}
        [HttpPost("deadlines/{user_id}")]
        public async Task<ActionResult<Deadline>> PostUserDeadline(int user_id, Deadline deadline)
        {
            if (deadline == null)
            {
                return BadRequest();
            }
            if (db.Deadlines.FirstOrDefault(dl => dl.Topic == deadline.Topic) != null) 
                return NotFound();

            deadline.User = db.Users.FirstOrDefault(user => user.User_id == user_id);
            db.Deadlines.Add(deadline);
            // Give achievement.
            var getId = db.Achievements.FirstOrDefault(t => t.Name.Contains("Розумні часи"));
            var user = db.Users.FirstOrDefault(u => u.User_id == user_id);
            var achievementUser = db.AchievementUsers
                .Include(test => test.User)
                .Include(test => test.Achievement)
                .FirstOrDefault(t => t.Achievement.Name == "Розумні часи" && t.User_id == user_id);
            if (achievementUser == null)
            {
                db.AchievementUsers.Add(new AchievementUser()
                {
                    Achievement_id = getId.Achievement_id,
                    User_id = user.User_id
                });
                user.Gained_achievements++;
                db.Entry(user).State = EntityState.Modified;
            }

            await db.SaveChangesAsync();
            return Ok(deadline);
        }

        // POST: Users/deadlines/{id}
        [HttpPut("deadlines/{id}")]
        public async Task<IActionResult> PutUserDeadline(int id, Deadline deadline)
        {
            db.Entry(deadline).State = EntityState.Modified;
            await db.SaveChangesAsync();

            return NoContent();
        }

        // DELETE Users/deadlines/{id}
        [HttpDelete("deadlines/{id}/{isFinished}")]
        public async Task<ActionResult<Deadline>> DeleteDeadline(int id, bool isFinished = false)
        {
            Deadline deadline = db.Deadlines
                .Include(dl => dl.User)
                .FirstOrDefault(dl => dl.Deadline_id == id);
            User user = deadline.User;

            if (isFinished) deadline.Finished = isFinished; // ??
            if (isFinished)
            {
                user.Finished_deadlines++;
                db.Entry(user).State = EntityState.Modified;
            }

            if (deadline == null)
            {
                return NotFound();
            }
            db.Deadlines.Remove(deadline);
            await db.SaveChangesAsync();
            return Ok(deadline);
        }

        #region Statistics
        // Statistics.
        [HttpGet("statistics/getPassedTests/{user_id}")]
        public async Task<ActionResult<int>> GetPassedTests(int user_id)
        {
            User user = await db.Users.FirstOrDefaultAsync(x => x.User_id == user_id);
            if (user == null)
                return NotFound();
            return new ObjectResult(user.Passed_tests);
        }

        [HttpGet("statistics/getGainedAchievements/{user_id}")]
        public async Task<ActionResult<int>> GetPassedAchievements(int user_id)
        {
            User user = await db.Users.FirstOrDefaultAsync(x => x.User_id == user_id);
            if (user == null)
                return NotFound();
            return new ObjectResult(user.Gained_achievements);
        }

        [HttpGet("statistics/getCompletedTopics/{user_id}")]
        public async Task<ActionResult<int>> GetCompletedTopics(int user_id)
        {
            User user = await db.Users.FirstOrDefaultAsync(x => x.User_id == user_id);
            if (user == null)
                return NotFound();
            return new ObjectResult(user.Completed_topics);
        }

        [HttpGet("statistics/getTotalLearnedPhrases/{user_id}")]
        public async Task<ActionResult<int>> GetTotalLearnedPhrases(int user_id)
        {
            User user = await db.Users.FirstOrDefaultAsync(x => x.User_id == user_id);
            if (user == null)
                return NotFound();
            return new ObjectResult(user.Total_learned_phrases);
        }

        [HttpGet("statistics/getAlphabetProgress/{user_id}")]
        public async Task<ActionResult<int>> GetAlphabetProgress(int user_id)
        {
            User user = await db.Users.FirstOrDefaultAsync(x => x.User_id == user_id);
            if (user == null)
                return NotFound();
            return new ObjectResult(user.Alphabet_progress);
        }

        //[HttpPut("statistics/getCompletedTopics/{user_id}")]
        //public async Task<ActionResult<int>> PutCompletedTopics(int user_id)
        //{
            //User user = await db.Users.FirstOrDefaultAsync(x => x.User_id == user_id);
            //if (user == null)
            //    return NotFound();
            //return new ObjectResult(user.Completed_topics);


            //db.Entry(user).State = EntityState.Modified;

            //try
            //{
            //    await db.SaveChangesAsync();
            //}
            //catch (DbUpdateConcurrencyException)
            //{
            //    if (!UserExists(id))
            //    {
            //        return NotFound();
            //    }
            //    else
            //    {
            //        throw;
            //    }
            //}

            //return NoContent();
        //}

        //[HttpGet("statistics/putTotalLearnedPhrases/{user_id}")]
        //public async Task<ActionResult<int>> PutTotalLearnedPhrases(int user_id)
        //{
        //    //User user = await db.Users.FirstOrDefaultAsync(x => x.User_id == user_id);
        //    //if (user == null) return NotFound();
            
        //    ////var userPhrases = await db.


        //    //db.Entry(user).State = EntityState.Modified;

        //    //try
        //    //{
        //    //    await db.SaveChangesAsync();
        //    //}
        //    //catch (DbUpdateConcurrencyException)
        //    //{
        //    //    if (!UserExists(id))
        //    //    {
        //    //        return NotFound();
        //    //    }
        //    //    else
        //    //    {
        //    //        throw;
        //    //    }
        //    //}

        //    //return NoContent();
        //}
        #endregion



    }
}
