﻿using LangTool_ASP.NET_Web_API.Models;
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

        // GET achievements/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Achievement>> Get(int id)
        {
            Achievement achievement = await db.Achievements.FirstOrDefaultAsync(x => x.Achievement_id == id);
            if (achievement == null)
                return NotFound();
            return new ObjectResult(achievement);
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

        //// PUT achievements/
        //[HttpPut]
        //public async Task<ActionResult<Achievement>> Put(Achievement achievement)
        //{
        //    if (achievement == null)
        //    {
        //        return BadRequest();
        //    }
        //    if (!db.Achievements.Any(x => x.Achievement_id == achievement.Achievement_id))
        //    {
        //        return NotFound();
        //    }

        //    db.Update(achievement);
        //    await db.SaveChangesAsync();
        //    return Ok(achievement);
        //}

        //// DELETE achievements/5
        //[HttpDelete("{id}")]
        //public async Task<ActionResult<Achievement>> Delete(int id)
        //{
        //    Achievement achievement = db.Achievements.FirstOrDefault(x => x.Achievement_id == id);
        //    if (achievement == null)
        //    {
        //        return NotFound();
        //    }
        //    db.Achievements.Remove(achievement);
        //    await db.SaveChangesAsync();
        //    return Ok(achievement);
        //}
    }
}
