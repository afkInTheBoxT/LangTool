using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool_ASP.NET_Web_API.Models
{
    public class Phrase
    {
        [Key]
        public int Phrase_Id { get; set; }
        public string TopicName { get; set; }
        public string PhraseName { get; set; }
        //public int PhraseImage { get; set; }
        //public int PhraseAudio { get; set; }


        //public List<Phrase_User> Phrase_Users { get; set; }
        public List<User> User { get; set; }
    }
}
