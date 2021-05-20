using LangTool.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        LangToolContext db;


        public UserController(LangToolContext context)
        {
            db = context;

            if (!db.UsersT.Any())
            {
                db.UsersT.Add(new UserT { Id = 1, Name = "Tom",
                    Email = "email1@gmail.com", Password = "Qwerty1234511111" });
                db.UsersT.Add(new UserT { Id = 2, Name = "Bob",
                    Email = "email2@gmail.com", Password = "Qwerty1234522222" });
                db.SaveChanges();
            }
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<UserT>>> Get()
        {
            return await db.UsersT.ToListAsync();
        }

        // GET api/users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<UserT>> Get(int id)
        {
            UserT user = await db.UsersT.FirstOrDefaultAsync(x => x.Id == id);
            if (user == null)
                return NotFound();
            return new ObjectResult(user);
        }

        // POST api/users
        [HttpPost]
        public async Task<ActionResult<UserT>> Post(UserT user)
        {
            if (user == null)
            {
                return BadRequest();
            }

            db.UsersT.Add(user);
            await db.SaveChangesAsync();
            return Ok(user);
        }

        // PUT api/users/
        [HttpPut]
        public async Task<ActionResult<UserT>> Put(UserT user)
        {
            if (user == null)
            {
                return BadRequest();
            }
            if (!db.UsersT.Any(x => x.Id == user.Id))
            {
                return NotFound();
            }

            db.Update(user);
            await db.SaveChangesAsync();
            return Ok(user);
        }

        // DELETE api/users/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<UserT>> Delete(int id)
        {
            UserT user = db.UsersT.FirstOrDefault(x => x.Id == id);
            if (user == null)
            {
                return NotFound();
            }
            db.UsersT.Remove(user);
            await db.SaveChangesAsync();
            return Ok(user);
        }
    }
}
