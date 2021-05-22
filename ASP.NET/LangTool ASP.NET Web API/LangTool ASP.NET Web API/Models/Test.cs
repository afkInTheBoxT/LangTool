using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool_ASP.NET_Web_API.Models
{
    public class Test
    {
        [Key]
        public int Test_id { get; set; }
        public string TestName { get; set; }
        public float TotalMark { get; set; }

        public virtual ICollection<TestUser> TestUsers { get; set; }
        //public List<Question_Test> Question_Tests { get; set; }
        //public List<User> Users { get; set; }
        public List<Question> Questions { get; set; }
    }
}
