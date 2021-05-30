using LangTool_ASP.NET_Web_API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool_ASP.NET_Web_API
{
    [Route("[controller]")]
    [ApiController]
    public class AchievementsController : ControllerBase
    {
        Context db;


        public AchievementsController(Context context)
        {
            db = context;
               
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Achievement>>> Get()
        {
            return await db.Achievements.ToListAsync();
        }

        //// GET achievements/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<Achievement>> Get(int id)
        //{
        //    Achievement achievement = await db.Achievements.FirstOrDefaultAsync(x => x.Achievement_id == id);
        //    if (achievement == null)
        //        return NotFound();
        //    return new ObjectResult(achievement);
        //}

        // GET achievements/getAchievement/1
        [HttpGet("getAchievement/{User_id}")]
        public async Task<ActionResult<IEnumerable<Achievement>>> Get(int user_id)
        {
            var result = await db.Achievements
               .Include(achievement => achievement.User)
               .Where(achievement => achievement.User.Any(c => c.User_id == user_id))
               .ToListAsync();

            return result;
        }


        // PUT achievements/{5}
        [HttpPut("{User_id}")]
        public async Task<ActionResult<Achievement>> Put(Achievement achievement)
        {
            if (achievement == null)
            {
                return BadRequest();
            }
            if (!db.Achievements.Any(x => x.Achievement_id == achievement.Achievement_id))
            {
                return NotFound();
            }

            db.Update(achievement);
            await db.SaveChangesAsync();
            return Ok(achievement);
        }

        //// POST achievements
        //[HttpPost]
        //public async Task<ActionResult<Achievement>> Post(Achievement achievement)
        //{
        //    if (achievement == null)
        //    {
        //        return BadRequest();
        //    }

        //    db.Achievements.Add(achievement);
        //    await db.SaveChangesAsync();
        //    return Ok(achievement);
        //}


        [HttpGet("testGainAchievement")]
        public async Task<ActionResult<IEnumerable<Achievement>>> GetAc()
        {
            GainAchievement(1, achievement_id: 1);
            return NoContent();
        }

        public async void GainAchievement(int user_id, string achievement_name = "", int achievement_id = -1)
        {
            var userAchievements = await db.Achievements
              .Include(achievement => achievement.User)
              .Where(achievement => achievement.User.Any(c => c.User_id == user_id))
              .ToListAsync();

            var user = db.Users
                .Include(user => user.Achievements)
                .FirstOrDefault(user => user.User_id == user_id);


            if (achievement_id >= 0)
            {
                if (userAchievements.
                FirstOrDefault(achievement => achievement.Achievement_id == achievement_id) == null)
                {
                    user.Achievements.Add(
                        db.Achievements.
                        Where(achievement => achievement.Achievement_id == achievement_id).
                        FirstOrDefault()
                        ) ;

                    db.Entry(user).State = EntityState.Modified;

                    //try
                    //{
                        await db.SaveChangesAsync();
                    //}
                    //catch (DbUpdateConcurrencyException)
                    //{
                    //    if (!PhraseExists(id))
                    //    {
                    //        return NotFound();
                    //    }
                    //    else
                    //    {
                    //        throw;
                    //    }
                    //}
                }
            }
            else if (achievement_name != "")
            {
                if (userAchievements.
                FirstOrDefault(achievement => achievement.Name == achievement_name) == null)
                {

                }
            }
        }
    }
}
