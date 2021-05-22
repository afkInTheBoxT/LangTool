using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool_ASP.NET_Web_API.Models
{
    public class Achievement
    {
        [Key]
        public int Achievement_id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        //public int Photo { get; set; }

        public List<User> User { get; set; }
    }
}
