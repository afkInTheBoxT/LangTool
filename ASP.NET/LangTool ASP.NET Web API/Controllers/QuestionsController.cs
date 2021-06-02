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
        [HttpGet("answers/{question_id}")]
        public async Task<ActionResult<IEnumerable<Answer>>> GetAnswersOnQuestion(int question_id)
        {
            var answers = await db.Answers
                .Include(answ => answ.Question)
                .Where(answ => answ.Question.Any(quest => quest.Question_id == question_id))
                .ToListAsync();

            return answers;
        }
    }
}
