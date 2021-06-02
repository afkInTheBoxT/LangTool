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
    public class QuestionsController : ControllerBase
    {
        private readonly Context db;

        public QuestionsController(Context context)
        {
            db = context;

            
        }

        //// GET: Questions
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<Question>>> GetQuestions()
        //{
        //    return await db.Questions.ToListAsync();
        //}

        // GET: Questions/Food
        [HttpGet("{testName}")]
        public async Task<ActionResult<IEnumerable<Question>>> GetQuestions(string testname)
        {
            var result = await db.Questions
                .Include(quest => quest.Tests)
                .Where(quest => quest.Tests.Select(test => test.TestName).Contains(testname)).ToListAsync();

            return result;
        }

        // GET: Questions/answers/{question_name}
        [HttpGet("answers/{question_name}")]
        public async Task<ActionResult<IEnumerable<Answer>>> GetAnswersOnQuestion(string question_name)
        {
            var answers = await db.Answers
                .Include(answ => answ.Question)
                .Where(answ => answ.Question.Any(quest => quest.QuestionName.Contains(question_name)))
                .ToListAsync();

            return answers;
        }
        
        //// PUT: Questions/5
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutQuestion(int id, Question question)
        //{
        //    if (id != question.Question_id)
        //    {
        //        return BadRequest();
        //    }

        //    db.Entry(question).State = EntityState.Modified;

        //    try
        //    {
        //        await db.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!QuestionExists(id))
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

        //// POST: Questions
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        //public async Task<ActionResult<Question>> PostQuestion(Question question)
        //{
        //    db.Questions.Add(question);
        //    await db.SaveChangesAsync();

        //    return CreatedAtAction("GetQuestion", new { id = question.Question_id }, question);
        //}

        //// DELETE: Questions/5
        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteQuestion(int id)
        //{
        //    var question = await db.Questions.FindAsync(id);
        //    if (question == null)
        //    {
        //        return NotFound();
        //    }

        //    db.Questions.Remove(question);
        //    await db.SaveChangesAsync();

        //    return NoContent();
        //}

        //private bool QuestionExists(int id)
        //{
        //    return db.Questions.Any(e => e.Question_id == id);
        //}
    }
}
