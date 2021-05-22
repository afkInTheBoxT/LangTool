using LangTool_ASP.NET_Web_API.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace LangTool_ASP.NET_Web_API
{
    [Route("test/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        Context db;


        public UsersController(Context context)
        {
            db = context;

            if (!db.Users.Any())
            {
                db.Users.Add(new User { Name = "Tom", Email = "Tom@gna", Password = "Qwerty" });
                db.Users.Add(new User { Name = "Alice", Email = "secondemaul@gna", Password = "12Qwerty" });
                db.SaveChanges();
            }

            // To clear db as a test.
            //if (db.Users.Any())
            //{
            //    var records = db.Users.Select(user => user);
            //    foreach (var record in records)
            //    {
            //        db.Users.Remove(record);
            //    }
            //    db.SaveChanges();
            //}
        }

        //[Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> Get()
        {
            return await db.Users.ToListAsync();
        }

        //// GET test/users/{id}
        //[HttpGet("{id}")]
        //public async Task<ActionResult<User>> Get(int id)
        //{
        //    User user = await db.Users.FirstOrDefaultAsync(x => x.Id == id);
        //    if (user == null)
        //        return NotFound();
        //    return new ObjectResult(user);
        //}

        // GET test/users/{email}
        [HttpGet("{Email}")]
        public async Task<ActionResult<User>> Get(string email)
        {
            User user = await db.Users.FirstOrDefaultAsync(x => x.Email == email);
            if (user == null)
                return NotFound();
            return new ObjectResult(user);
        }


        // POST test/users
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

        // PUT test/users/
        [HttpPut]
        public async Task<ActionResult<User>> Put(User user)
        {
            if (user == null)
            {
                return BadRequest();
            }
            if (!db.Users.Any(x => x.User_id == user.User_id))
            {
                return NotFound();
            }

            db.Update(user);
            await db.SaveChangesAsync();
            return Ok(user);
        }

        // DELETE test/users/{email}
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
    }
}
