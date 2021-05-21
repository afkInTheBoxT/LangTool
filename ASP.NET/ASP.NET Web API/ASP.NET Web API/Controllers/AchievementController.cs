﻿using ASP.NET_Web_API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ASP.NET_Web_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AchievementController : ControllerBase
    {
        Context db;


        public AchievementController(Context context)
        {
            db = context;
            if (!db.Achievements.Any())
            {
                db.Achievements.Add(new Achievement { Name = "Do it!", Description = "Finish the 1st stage" });
                db.Achievements.Add(new Achievement { Name = "Do it x2!", Description = "Finish the 2nd stage" });
                db.SaveChanges();
            }             
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<Achievement>>> Get()
        {
            return await db.Achievements.ToListAsync();
        }

        // GET api/achievement/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Achievement>> Get(int id)
        {
            Achievement achievement = await db.Achievements.FirstOrDefaultAsync(x => x.Id == id);
            if (achievement == null)
                return NotFound();
            return new ObjectResult(achievement);
        }

        // POST api/achievements
        [HttpPost]
        public async Task<ActionResult<Achievement>> Post(Achievement achievement)
        {
            if (achievement == null)
            {
                return BadRequest();
            }

            db.Achievements.Add(achievement);
            await db.SaveChangesAsync();
            return Ok(achievement);
        }

        // PUT api/achievements/
        [HttpPut]
        public async Task<ActionResult<Achievement>> Put(Achievement achievement)
        {
            if (achievement == null)
            {
                return BadRequest();
            }
            if (!db.Achievements.Any(x => x.Id == achievement.Id))
            {
                return NotFound();
            }

            db.Update(achievement);
            await db.SaveChangesAsync();
            return Ok(achievement);
        }

        // DELETE api/achievements/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Achievement>> Delete(int id)
        {
            Achievement achievement = db.Achievements.FirstOrDefault(x => x.Id == id);
            if (achievement == null)
            {
                return NotFound();
            }
            db.Achievements.Remove(achievement);
            await db.SaveChangesAsync();
            return Ok(achievement);
        }
    }
}
