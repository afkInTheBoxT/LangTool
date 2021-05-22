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
        private readonly Context _context;

        public TestsController(Context context)
        {
            _context = context;
        }

        // GET: Tests
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Test>>> GetTests()
        {
            return await _context.Tests.ToListAsync();
        }


        private bool TestExists(int id)
        {
            return _context.Tests.Any(e => e.Test_id == id);
        }


        #region OtherRequests
        //// GET: Tests/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<Test>> GetTest(int id)
        //{
        //    var test = await _context.Tests.FindAsync(id);

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

        //    _context.Entry(test).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
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
        //    _context.Tests.Add(test);
        //    await _context.SaveChangesAsync();

        //    return CreatedAtAction("GetTest", new { id = test.Test_id }, test);
        //}

        //// DELETE: Tests/5
        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteTest(int id)
        //{
        //    var test = await _context.Tests.FindAsync(id);
        //    if (test == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.Tests.Remove(test);
        //    await _context.SaveChangesAsync();

        //    return NoContent();
        //}
        #endregion
    }
}
