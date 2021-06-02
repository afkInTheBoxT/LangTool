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
    [Route("api/[controller]")]
    [ApiController]
    public class AchievementUsersController : ControllerBase
    {
        private readonly Context _context;


        public AchievementUsersController(Context context)
        {
            _context = context;
        }


        // GET: api/AchievementUsers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AchievementUser>>> GetAchievementUsers()
        {
            return await _context.AchievementUsers.ToListAsync();
        }

        // GET: api/AchievementUsers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<AchievementUser>> GetAchievementUser(int id)
        {
            var achievementUser = await _context.AchievementUsers.FindAsync(id);

            if (achievementUser == null)
            {
                return NotFound();
            }

            return achievementUser;
        }

        // PUT: api/AchievementUsers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAchievementUser(int id, AchievementUser achievementUser)
        {
            if (id != achievementUser.AchievementUser_id)
            {
                return BadRequest();
            }
            _context.Entry(achievementUser).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AchievementUserExists(id))
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

        // POST: api/AchievementUsers
        [HttpPost]
        public async Task<ActionResult<AchievementUser>> PostAchievementUser(AchievementUser achievementUser)
        {
            _context.AchievementUsers.Add(achievementUser);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAchievementUser", 
                new { id = achievementUser.AchievementUser_id }, achievementUser);
        }

        // DELETE: api/AchievementUsers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAchievementUser(int id)
        {
            var achievementUser = await _context.AchievementUsers.FindAsync(id);
            if (achievementUser == null)
            {
                return NotFound();
            }

            _context.AchievementUsers.Remove(achievementUser);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AchievementUserExists(int id)
        {
            return _context.AchievementUsers.Any(e => e.AchievementUser_id == id);
        }
    }
}
