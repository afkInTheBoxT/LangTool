using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool_ASP.NET_Web_API.Models
{
    public class TestUser
    {
        [Key]
        public int TestUser_id { get; set; }

        public virtual User User { get; set; }
        public int User_id { get; set; }
        public virtual Test Test { get; set; }
        public int Test_id { get; set; }



        public bool IsEnabled { get; set; }
        public float CurrentMark { get; set; }
    }
}
