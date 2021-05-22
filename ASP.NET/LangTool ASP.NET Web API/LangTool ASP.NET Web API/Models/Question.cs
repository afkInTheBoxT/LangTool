using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool_ASP.NET_Web_API.Models
{
    public class Question
    {
        [Key]
        public int Question_id { get; set; }
        public string QuestionName { get; set; }
        public float Multiplyer { get; set; } // Коефіцієнт складності завдання - m.

        //public List<Question_Answer> Question_Answers { get; set; }
        //public List<Question_Test> Question_Tests { get; set; }
        public List<Answer> Answers { get; set; }
        public List<Test> Tests { get; set; }
    }
}
