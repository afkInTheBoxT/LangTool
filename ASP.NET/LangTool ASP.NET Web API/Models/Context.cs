using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LangTool_ASP.NET_Web_API.Models;


namespace LangTool_ASP.NET_Web_API.Models
{
    public class Context : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Achievement> Achievements { get; set; }
        public DbSet<Phrase> Phrases { get; set; }
        public DbSet<Test> Tests { get; set; }
        public DbSet<Answer> Answers { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<Deadline> Deadlines { get; set; }
        public DbSet<AchievementUser> AchievementUsers { get; set; }


        public Context(DbContextOptions<Context> options)
            : base(options)
        {
            Database.EnsureCreated();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=(localdb)\mssqllocaldb;Database=testUserRegestration;Trusted_Connection=True;");
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




            modelBuilder.Entity<AchievementUser>().HasKey(achievementUser => achievementUser.AchievementUser_id);

            // Relationships.
            modelBuilder.Entity<AchievementUser>()
                .HasOne(achievementUser => achievementUser.Achievement)
                .WithMany(achievementUser => achievementUser.AchievementUsers)
                .HasForeignKey(achievementUser => achievementUser.Achievement_id);

            modelBuilder.Entity<AchievementUser>()
                .HasOne(achievementUser => achievementUser.User)
                .WithMany(achievementUser => achievementUser.AchievementUsers)
                .HasForeignKey(achievementUser => achievementUser.User_id);

            //modelBuilder.Entity<TestQuestion>().HasKey(testQuestion =>
            //   new
            //   {
            //       testQuestion.Test_id,
            //       testQuestion.Question_id
            //   });

            //// Relationships.
            //modelBuilder.Entity<TestQuestion>()
            //    .HasOne(testQuestion => testQuestion.Test)
            //    .WithMany(testQuestion => testQuestion.TestQuestion)
            //    .HasForeignKey(testQuestion => testQuestion.Test_id);

            //modelBuilder.Entity<TestQuestion>()
            //    .HasOne(testQuestion => testQuestion.Question)
            //    .WithMany(testQuestion => testQuestion.TestQuestion)
            //    .HasForeignKey(testQuestion => testQuestion.Question_id);
        }

        public DbSet<LangTool_ASP.NET_Web_API.Models.TestUser> TestUsers { get; set; }

        //public DbSet<LangTool_ASP.NET_Web_API.Models.TestQuestion> TestQuestion { get; set; }
    }
}
