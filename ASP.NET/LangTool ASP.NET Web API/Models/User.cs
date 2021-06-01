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
        public byte[] Image { get; set; }
        // Statistics.
        public DateTime date_of_registration { get; set; }
        public int Passed_tests { get; set; }
        public int Gained_achievements { get; set; }
        public int Completed_topics { get; set; }
        public int Total_learned_phrases { get; set; }
        public float Alphabet_progress { get; set; }
        public int Finished_deadlines { get; set; }

        //public List<Achievement> Achievements { get; set; }
        public IEnumerable<AchievementUser> AchievementUsers { get; set; }
        public List<Phrase> Phrases { get; set; }
        public virtual ICollection<TestUser> TestUser { get; set; }
        public IEnumerable<Deadline> Deadlines { get; set; }
    }
}
