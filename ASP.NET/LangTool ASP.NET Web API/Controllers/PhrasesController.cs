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
        private readonly Context _context;

        public PhrasesController(Context context)
        {
            _context = context;
        }

        // GET: Phrases
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Phrase>>> GetPhrases()
        {
            return await _context.Phrases.ToListAsync();
        }

        // GET: Phrases/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Phrase>> GetPhrase(int id)
        {
            var phrase = await _context.Phrases.FindAsync(id);

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

            _context.Entry(phrase).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
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
            _context.Phrases.Add(phrase);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPhrase", new { id = phrase.Phrase_Id }, phrase);
        }

        // DELETE: Phrases/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePhrase(int id)
        {
            var phrase = await _context.Phrases.FindAsync(id);
            if (phrase == null)
            {
                return NotFound();
            }

            _context.Phrases.Remove(phrase);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PhraseExists(int id)
        {
            return _context.Phrases.Any(e => e.Phrase_Id == id);
        }
    }
}
