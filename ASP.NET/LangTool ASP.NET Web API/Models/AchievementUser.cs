using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool_ASP.NET_Web_API.Models
{
    public class AchievementUser
    {
        [Key]
        public int AchievementUser_id { get; set; }

        public int Achievement_id { get; set; }
        public int User_id { get; set; }

        public User User { get; set; }
        public Achievement Achievement { get; set; }
    }
}
