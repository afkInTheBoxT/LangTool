using LangTool_ASP.NET_Web_API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;

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

        // GET achievements/getAchievement/1
        [HttpGet("getAchievement/{User_id}")]
        public async Task<ActionResult<IEnumerable<Achievement>>> Get(int user_id)
        {
            var result = await db.AchievementUsers
                .Include(achievement => achievement.Achievement)
                .Include(user => user.User)
                .Where(achievementUser => achievementUser.User_id == user_id)
                .Select(achievementUser => achievementUser.Achievement)
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

        [HttpGet("changeThemeAchievement/{user_id}")]
        public async Task<bool> SetDarkTheme(int user_id)
        {
            bool achievementReceived = false;
            // Give Achievement.
            var getId = db.Achievements.FirstOrDefault(t => t.Name.Contains("Свет-Тьма"));
            var user = db.Users.FirstOrDefault(u => u.User_id == user_id);
            var prevAchievement = db.AchievementUsers
               .Include(achievement => achievement.Achievement)
               .Include(user => user.User)
               .Where(achievementUser => achievementUser.User_id == user_id)
               .FirstOrDefault(achievementUser => achievementUser.Achievement.Name.Contains("Свет-Тьма"));
            if (prevAchievement == null)
            {
                db.AchievementUsers.Add(new AchievementUser()
                {
                    Achievement_id = getId.Achievement_id,
                    User_id = user.User_id
                });
                user.Gained_achievements++;
                db.Entry(user).State = EntityState.Modified;
                achievementReceived = true;
            }
            await db.SaveChangesAsync();
            return achievementReceived;
        }
    }
}
