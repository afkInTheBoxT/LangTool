﻿using System;
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
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Phrase>>> GetPhrases()
        {
            return await db.Phrases.ToListAsync();
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