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
    public class TestUsersController : ControllerBase
    {
        private readonly Context db;

        public TestUsersController(Context context)
        {
            db = context;            
        }


        // GET: TestUsers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TestUser>>> GetTestUser()
        {
            return await db.TestUsers.ToListAsync();
        }

        [HttpGet("{TestName}")]
        public async Task<ActionResult<Test>> Get(string testName)
        {
            TestUser testUser = await db.TestUsers.FirstOrDefaultAsync(x => x.Test.TestName == testName);
            if (testUser == null)
                return NotFound();
            return new ObjectResult(testUser);
        }

        [HttpGet("{testName}/{User_id}")]
        public async Task<ActionResult<bool>> Get(string testName, int user_id)
        {
            // Проверка на тему.
            var testUserCheck = db.TestUsers
                .Include(t => t.Test)
                .Include(t => t.User)
                .FirstOrDefault(t => t.User_id == user_id && t.Test.TestName == testName);
            if (testUserCheck == null || !testUserCheck.IsEnabled)
            {
                return false;
            }

            TestUser testUser = await db.TestUsers.FirstOrDefaultAsync(
                x => x.Test.TestName == testName && x.User.User_id == user_id);
            if (testUser == null)
                return false;
            return true;
        }

        // PUT: api/TestUsers/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTestUser(int id, TestUser testUser)
        {
            if (id != testUser.User_id)
            {
                return BadRequest();
            }

            db.Entry(testUser).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TestUserExists(id))
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

        // POST: api/TestUsers
        [HttpPost]
        public async Task<ActionResult<TestUser>> PostTestUser(TestUser testUser)
        {
            db.TestUsers.Add(testUser);
            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TestUserExists(testUser.User_id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTestUser", new { id = testUser.User_id }, testUser);
        }

        // DELETE: api/TestUsers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTestUser(int id)
        {
            var testUser = await db.TestUsers.FindAsync(id);
            if (testUser == null)
            {
                return NotFound();
            }

            db.TestUsers.Remove(testUser);
            await db.SaveChangesAsync();

            return NoContent();
        }

        private bool TestUserExists(int id)
        {
            return db.TestUsers.Any(e => e.User_id == id);
        }
    }
}
