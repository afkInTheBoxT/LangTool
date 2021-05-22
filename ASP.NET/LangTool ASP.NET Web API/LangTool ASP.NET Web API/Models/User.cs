using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool_ASP.NET_Web_API.Models
{
    public class User
    {
        [Key]
        public int User_id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public List<Achievement> Achievements { get; set; }
        public List<Phrase> Phrases { get; set; }
        //public List<Test> Tests{ get; set; }
        public virtual ICollection<TestUser> TestUser { get; set; }
    }
}
