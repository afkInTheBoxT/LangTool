using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LangTool.Models
{
    public class LangToolContext : DbContext
    {        public DbSet<UserT> UsersT { get; set; }
        public LangToolContext(DbContextOptions<LangToolContext> options)
            : base(options)
        {
            Database.EnsureCreated();
        }
    }
}
