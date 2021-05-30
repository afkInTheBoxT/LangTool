using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace LangTool_ASP.NET_Web_API.Models
{
    public class Deadline
    {
        [Key]
        public int Deadline_id { get; set; }
        public string Topic { get; set; }
        //public DateTime DateStart { get; set; }
        //public DateTime DateEnd { get; set; }
        public string DateStart { get; set; }
        public string DateEnd { get; set; }
        public bool Finished { get; set; }

        public User User { get; set; }
    }
}
