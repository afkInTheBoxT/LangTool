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
    public class TestsController : ControllerBase
    {
        private readonly Context db;

        public TestsController(Context context)
        {
            db = context;
        }

        // GET: Tests
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Test>>> GetTests()
        {
            return await db.Tests.ToListAsync();
        }


        [HttpGet("{TestName}")]
        public async Task<ActionResult<Test>> Get(string testName)
        {
            Test test = await db.Tests.FirstOrDefaultAsync(x => x.TestName == testName);
            if (test == null)
                return NotFound();
            return new ObjectResult(test);
        }


        // Проверка теста.
        [HttpPost("/checkTest/{TestName}")]
        public async Task<ActionResult<Test>> CheckTest(string testName)
        {
            Test test = await db.Tests.FirstOrDefaultAsync(x => x.TestName == testName);
            if (test == null)
                return NotFound();
            return new ObjectResult(test);
        }


        private bool TestExists(int id)
        {
            return db.Tests.Any(e => e.Test_id == id);
        }


        #region OtherRequests
        //// GET: Tests/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<Test>> GetTest(int id)
        //{
        //    var test = await db.Tests.FindAsync(id);

        //    if (test == null)
        //    {
        //        return NotFound();
        //    }

        //    return test;
        //}

        //// PUT: Tests/5
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutTest(int id, Test test)
        //{
        //    if (id != test.Test_id)
        //    {
        //        return BadRequest();
        //    }

        //    db.Entry(test).State = EntityState.Modified;

        //    try
        //    {
        //        await db.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!TestExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}

        //// POST: Tests
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        //public async Task<ActionResult<Test>> PostTest(Test test)
        //{
        //    db.Tests.Add(test);
        //    await db.SaveChangesAsync();

        //    return CreatedAtAction("GetTest", new { id = test.Test_id }, test);
        //}

        //// DELETE: Tests/5
        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteTest(int id)
        //{
        //    var test = await db.Tests.FindAsync(id);
        //    if (test == null)
        //    {
        //        return NotFound();
        //    }

        //    db.Tests.Remove(test);
        //    await db.SaveChangesAsync();

        //    return NoContent();
        //}
        #endregion
    }
}
