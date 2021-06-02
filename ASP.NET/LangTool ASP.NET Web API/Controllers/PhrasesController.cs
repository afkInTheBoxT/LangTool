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
    public class PhrasesController : ControllerBase
    {
        private readonly Context db;

        public PhrasesController(Context context)
        {
            db = context;            
        }

        // GET: Phrases
        [HttpGet("getByTopic/{topicName}")]
        public async Task<ActionResult<IEnumerable<Phrase>>> GetPhrases(string topicName)
        {
            return await db.Phrases
                .Where(phrase => phrase.TopicName == topicName) 
                .ToListAsync();
        }

        [HttpPost("test/test/test/{testId}")]
        public async Task<ActionResult<Test>> AddQuestionTests(int testId, Question question)
        {
            var testQuestions = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.Test_id == testId);
            testQuestions.Questions.Add(question);
            db.Entry(testQuestions).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return testQuestions;
        }

        [HttpGet("completeTopic/{topicName}/{user_id}")]
        public async Task<IActionResult> CompleteTopic(string topicName, int user_id)
        {
            var testUser = db.TestUsers
                .Include(tu => tu.User)
                .Include(tu => tu.Test)
                .FirstOrDefault(tu => tu.Test.TestName == topicName && tu.User_id == user_id);
            var test = db.Tests.FirstOrDefault(t => t.TestName == topicName);

            if (testUser != null)
            {
                testUser.IsEnabled = true;
            }
            else
            {
                db.TestUsers.Add(new TestUser() { User_id = user_id, Test_id = test.Test_id,
                    IsEnabled = true, CurrentMark = 0
                });
            }

            await db.SaveChangesAsync();
            return NoContent();
        }

        // GET: Phrases/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Phrase>> GetPhrase(int id)
        {
            var phrase = await db.Phrases.FindAsync(id);

            if (phrase == null)
            {
                return NotFound();
            }

            return phrase;
        }

        // PUT: Phrases/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPhrase(int id, Phrase phrase)
        {
            if (id != phrase.Phrase_Id)
            {
                return BadRequest();
            }

            db.Entry(phrase).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PhraseExists(id))
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

        // POST: Phrases
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Phrase>> PostPhrase(Phrase phrase)
        {
            db.Phrases.Add(phrase);
            await db.SaveChangesAsync();

            return CreatedAtAction("GetPhrase", new { id = phrase.Phrase_Id }, phrase);
        }

        // DELETE: Phrases/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePhrase(int id)
        {
            var phrase = await db.Phrases.FindAsync(id);
            if (phrase == null)
            {
                return NotFound();
            }

            db.Phrases.Remove(phrase);
            await db.SaveChangesAsync();

            return NoContent();
        }

        private bool PhraseExists(int id)
        {
            return db.Phrases.Any(e => e.Phrase_Id == id);
        }
    }
}
