using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace LangTool_ASP.NET_Web_API.Models
{
    public class Context : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Achievement> Achievements { get; set; }
        //public DbSet<Achievement_User> Achievement_Users { get; set; }
        public DbSet<Phrase> Phrases { get; set; }
        //public DbSet<Phrase_User> Phrase_Users { get; set; }
        public DbSet<Test> Tests { get; set; }
        //public DbSet<Test_User> Test_Users { get; set; }
        public DbSet<Answer> Answers { get; set; }
        //public DbSet<Question_Answer> Question_Answers { get; set; }
        public DbSet<Question> Questions { get; set; }
        //public DbSet<Question_Test> Question_Tests { get; set; }



        public Context(DbContextOptions<Context> options)
            : base(options)
        {
            Database.EnsureCreated();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // PrimaryKeys.
            //modelBuilder.Entity<User>().HasKey(user => user.User_id);
            //modelBuilder.Entity<Test>().HasKey(test => test.Test_id);
            modelBuilder.Entity<TestUser>().HasKey(testUser =>
                new
                {
                    testUser.User_id,
                    testUser.Test_id
                });

            // Relationships.
            modelBuilder.Entity<TestUser>()
                .HasOne(testUser => testUser.Test)
                .WithMany(testUser => testUser.TestUsers)
                .HasForeignKey(testUser => testUser.Test_id);

            modelBuilder.Entity<TestUser>()
                .HasOne(testUser => testUser.User)
                .WithMany(testUser => testUser.TestUser)
                .HasForeignKey(testUser => testUser.User_id);
        }

        //    // Relationships
        //    builder.Entity<UserEmail>()
        //        .HasRequired(t => t.Email)
        //        .WithMany(t => t.UserEmails)
        //        .HasForeignKey(t => t.EmailID)

        //    builder.Entity<UserEmail>()
        //        .HasRequired(t => t.User)
        //        .WithMany(t => t.UserEmails)
        //        .HasForeignKey(t => t.UserID)
        //}
    }
}
