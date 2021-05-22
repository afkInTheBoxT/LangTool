using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool_ASP.NET_Web_API.Models
{
    public class Answer
    {
        [Key]
        public int Answer_id { get; set; }
        public string CorrectAnswer { get; set; }
        public float Mark { get; set; } // Множник завдання (кількість балів).
                                        // Не булевий, оскільки можуть бути
                                        // завдання з декількома варіантами відповідей.

        //public List<Question_Answer> Question_Answers { get; set; }
        public List<Question> Question { get; set; }
    }
}
