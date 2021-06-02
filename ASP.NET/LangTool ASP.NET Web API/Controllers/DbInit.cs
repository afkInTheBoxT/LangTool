using LangTool_ASP.NET_Web_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;
using Microsoft.EntityFrameworkCore;

namespace LangTool_ASP.NET_Web_API.Controllers
{
    public class DbInit
    {
        public static void InitializeData(Context db)
        {
            AddUsers(db);
            AddTests(db);
            AddAchievements(db);
            AddPhrases(db);
            AddQuestions(db);
            AddTestUsers(db);
            
            //if (!db.TestQuestion.Any())
            //{
            //    db.TestQuestion.Add(new TestQuestion { Question_id = 1, Test_id = 1 });
            //    db.TestQuestion.Add(new TestQuestion { Question_id = 2, Test_id = 1 });
            //    db.SaveChanges();
            //}
           
            //if (!db.Answers.Any()) {
            //    db.Answers.Add(new Answer { Answer_id = 1, CorrectAnswer = "a)", Mark = 5 });
            //    db.Answers.Add(new Answer { Answer_id = 2, CorrectAnswer = "b)", Mark = 0 });
            //}
        }

        public static void AddUsers(Context db)
        {
            if (!db.Users.Any())
            {
                byte[] imageData;
                using (FileStream fs = new FileStream(@"../photo1.jpg", FileMode.Open))
                {
                    imageData = new byte[fs.Length];
                    fs.Read(imageData, 0, imageData.Length);
                }
                db.Users.Add(new User
                {
                    User_id = 1,
                    Name = "Tom",
                    Email = "Tom@gna",
                    Password = "Qwerty",
                    date_of_registration = new DateTime(2021, 02, 20),
                    Passed_tests = 0,
                    Gained_achievements = 0,
                    Completed_topics = 0,
                    Total_learned_phrases = 0,
                    Alphabet_progress = 0
                });
                using (FileStream fs = new FileStream(@"../photo2.png", FileMode.Open))
                {
                    imageData = new byte[fs.Length];
                    fs.Read(imageData, 0, imageData.Length);
                }
                db.Users.Add(new User
                {
                    User_id = 2,
                    Name = "Alice",
                    Email = "secondemaul@gna",
                    Password = "12Qwerty",
                    date_of_registration = new DateTime(2021, 01, 08),
                    Image = imageData
                });
                using (FileStream fs = new FileStream(@"../photo3.jpg", FileMode.Open))
                {
                    imageData = new byte[fs.Length];
                    fs.Read(imageData, 0, imageData.Length);
                }
                db.Users.Add(new User
                {
                    User_id = 3,
                    Name = "Фред",
                    Email = "fred@gmail.com",
                    Password = "12Qwerty",
                    date_of_registration = new DateTime(2020, 05, 13),
                    Image = imageData
                });
                using (FileStream fs = new FileStream(@"../photo4.jpg", FileMode.Open))
                {
                    imageData = new byte[fs.Length];
                    fs.Read(imageData, 0, imageData.Length);
                }
                db.Users.Add(new User
                {
                    User_id = 4,
                    Name = "Іванко",
                    Email = "ivanko@gmail.com",
                    Password = "12Qwerty",
                    date_of_registration = new DateTime(2021, 01, 15),
                    Image = imageData
                });
                db.SaveChanges();
            }
        }

        public static void AddTests(Context db)
        {
            if (!db.Tests.Any())
            {
                db.Tests.Add(new Test { TestName = "Їжа", TotalMark = 100 });
                db.Tests.Add(new Test { TestName = "Транспорт", TotalMark = 200 });
                db.Tests.Add(new Test { TestName = "Питання", TotalMark = 200 });
                db.Tests.Add(new Test { TestName = "Дати", TotalMark = 200 });
                db.Tests.Add(new Test { TestName = "Кольори", TotalMark = 200 });
                db.Tests.Add(new Test { TestName = "Природа", TotalMark = 200 });
                db.SaveChanges();
            }
        }

        public static void AddAchievements(Context db)
        {
            if (!db.Achievements.Any())
            {
                db.Achievements.Add(new Achievement { Name = "Upgrade", Description = "Підвищіть оцінку за тест" });
                db.Achievements.Add(new Achievement { Name = "Перший дзвоник", Description = "Зареєструйтеся у додатку" });
                db.Achievements.Add(new Achievement { Name = "Розумні часи", Description = "Завершіть ваш перший дедлайн" });
                db.Achievements.Add(new Achievement { Name = "Свет-Тьма", Description = "Змініть тему" });
                db.Achievements.Add(new Achievement { Name = "Їжа", Description = "Закінчіть тему Їжа" });
                db.Achievements.Add(new Achievement { Name = "Транспорт", Description = "Закінчіть тему Транспорт" });
                db.Achievements.Add(new Achievement { Name = "Питання", Description = "Закінчіть тему Питання" });
                db.Achievements.Add(new Achievement { Name = "Дати", Description = "Закінчіть тему Дати" });
                db.Achievements.Add(new Achievement { Name = "Кольори", Description = "Закінчіть тему Кольори" });
                db.Achievements.Add(new Achievement { Name = "Природа", Description = "Закінчіть тему Природа" });
                db.SaveChanges();
            }
        }

        public static void AddPhrases(Context db)
        {
            if (!db.Phrases.Any())
            {
                #region Food

                db.Phrases.Add(new Phrase
                {
                    TopicName = "Їжа",
                    translatePhraseName = "Я їм хліб",
                    japanesePhraseName = "パンを食べる"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Їжа",
                    translatePhraseName = "Я хочу купити масло",
                    japanesePhraseName = "石油を買いたい"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Їжа",
                    translatePhraseName = "У мене немає сиру",
                    japanesePhraseName = "チーズがない"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Їжа",
                    translatePhraseName = "Він хоче приготовити бутерброд",
                    japanesePhraseName = "彼はサンドイッチを作りたい"
                });
                #endregion

                #region Transport

                db.Phrases.Add(new Phrase
                {
                    TopicName = "Транспорт",
                    translatePhraseName = "Я їду на велосипеді",
                    japanesePhraseName = "自転車に乗る"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Транспорт",
                    translatePhraseName = "Він купив мотоцикл",
                    japanesePhraseName = "彼はオートバイを買った"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Транспорт",
                    translatePhraseName = "Мама часто користується автобусом",
                    japanesePhraseName = "お母さんはよくバスを利用します"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Транспорт",
                    translatePhraseName = "Вони катаються на авто",
                    japanesePhraseName = "彼らは車に乗る"
                });
                #endregion

                #region Questions

                db.Phrases.Add(new Phrase
                {
                    TopicName = "Питання",
                    translatePhraseName = "Як тебе звати?",
                    japanesePhraseName = "お名前は何ですか？"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Питання",
                    translatePhraseName = "Скільки тобі років?",
                    japanesePhraseName = "あなたは何歳ですか？"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Питання",
                    translatePhraseName = "Скільки це коштує?",
                    japanesePhraseName = "それはどれくらいしますか？"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Питання",
                    translatePhraseName = "Який це колір?",
                    japanesePhraseName = "それは何色です？"
                });
                #endregion

                #region Dates

                db.Phrases.Add(new Phrase
                {
                    TopicName = "Дати",
                    translatePhraseName = "Сьогодні середа",
                    japanesePhraseName = "今日は水曜日です"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Дати",
                    translatePhraseName = "Завтра дванадцяте  червня",
                    japanesePhraseName = "明日は6月12日"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Дати",
                    translatePhraseName = "Вчора був понеділок",
                    japanesePhraseName = "昨日は月曜日"
                });
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Дати",
                    translatePhraseName = "Я народився дві тисячі першого року",
                    japanesePhraseName = "私は最初の年に2000人生まれ"
                });
                #endregion

                #region Colors

                db.Phrases.Add(new Phrase
                {
                    TopicName = "Кольори",
                    translatePhraseName = "На дворі жовте сонце",
                    japanesePhraseName = "庭の黄色い太陽"
                });
                db.SaveChanges();
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Кольори",
                    translatePhraseName = "Її блузка яскраво червона",
                    japanesePhraseName = "彼女のブラウスは真っ赤です"
                });
                db.SaveChanges();
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Кольори",
                    translatePhraseName = "Білий верх, чорний низ",
                    japanesePhraseName = "ホワイトトップ、ブラックボトム"
                });
                db.SaveChanges();
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Кольори",
                    translatePhraseName = "Колір очей моєї мами зелений",
                    japanesePhraseName = "母の目は緑"
                });
                db.SaveChanges();
                #endregion

                #region Nature

                db.Phrases.Add(new Phrase
                {
                    TopicName = "Природа",
                    translatePhraseName = "Це - мудре дерево дуб",
                    japanesePhraseName = "賢いoの木です"
                });
                db.SaveChanges();
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Природа",
                    translatePhraseName = "На новий рік моя родина ставить зелену ялинку",
                    japanesePhraseName = "新年には、私の家族は緑のクリスマス ツリーを置きます"
                });
                db.SaveChanges();
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Природа",
                    translatePhraseName = "Дівчата люблять троянди",
                    japanesePhraseName = "女の子はバラが大好き"
                });
                db.SaveChanges();
                db.Phrases.Add(new Phrase
                {
                    TopicName = "Природа",
                    translatePhraseName = "Ця квітка приємно пахне",
                    japanesePhraseName = "この花はいいにおいがする"
                });
                #endregion

                db.SaveChanges();
            }
        }

        public static async void AddQuestions(Context db)
        {
            if (!db.Questions.Any())
            {
                var test = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.TestName == "Їжа");
                Question temp = new Question { QuestionName = "Переведіть вираз パンを食べる", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 石油を買いたい", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз チーズがない", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 彼はサンドイッチを作りたい", Multiplyer = 1 };
                db.Questions.Add(temp);                
                test.Questions.Add(temp);  

                //await db.SaveChangesAsync();

                test = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.TestName == "Транспорт");
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question {QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                db.Entry(test).State = EntityState.Modified;


                test = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.TestName == "Питання");
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                db.Entry(test).State = EntityState.Modified;


                test = db.Tests
                 .Include(t => t.Questions)
                 .FirstOrDefault(t => t.TestName == "Дати");
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                db.Entry(test).State = EntityState.Modified;

                test = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.TestName == "Кольори");
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                db.Entry(test).State = EntityState.Modified;


                test = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.TestName == "Природа");
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Where are u from?", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                db.Entry(test).State = EntityState.Modified;


                await db.SaveChangesAsync();
            }
        }

        public static void AddTestUsers(Context db)
        {
            if (!db.TestUsers.Any())
            {
                db.TestUsers.Add(new TestUser { User_id = 1, Test_id = 1, IsEnabled = true, CurrentMark = 0 });
                db.TestUsers.Add(new TestUser { User_id = 2, Test_id = 1, IsEnabled = true, CurrentMark = 0 });
                db.TestUsers.Add(new TestUser { User_id = 2, Test_id = 2, IsEnabled = true, CurrentMark = 0 });
                db.TestUsers.Add(new TestUser { User_id = 3, Test_id = 1, IsEnabled = true, CurrentMark = 0 });
                db.TestUsers.Add(new TestUser { User_id = 3, Test_id = 2, IsEnabled = true, CurrentMark = 0 });
                db.TestUsers.Add(new TestUser { User_id = 3, Test_id = 3, IsEnabled = true, CurrentMark = 0 });
                db.TestUsers.Add(new TestUser { User_id = 4, Test_id = 1, IsEnabled = true, CurrentMark = 0 });
                db.TestUsers.Add(new TestUser { User_id = 4, Test_id = 2, IsEnabled = true, CurrentMark = 0 });
                db.TestUsers.Add(new TestUser { User_id = 4, Test_id = 3, IsEnabled = true, CurrentMark = 0 });
                db.TestUsers.Add(new TestUser { User_id = 4, Test_id = 4, IsEnabled = true, CurrentMark = 0 });
                db.SaveChanges();
            }
        }

        public static async void AddAnswers(Context db)
        {
            #region Food

            var question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 1);
            var temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 2);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 3);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 4);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 5);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 6);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 7);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 8);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 9);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 10);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
                .Include(t => t.Answers)
                .FirstOrDefault(t => t.Question_id == 11);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 12);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;


            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 13);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 14);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 15);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 16);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;
            #endregion

            #region Transport
            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 17);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 18);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 19);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 20);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;


            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 21);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 22);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 23);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 24);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 25);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 26);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 27);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 28);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 29);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 30);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 31);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 32);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;
            #endregion

            #region Transport
            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 33);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 34);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 35);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 36);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;


            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 37);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 38);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 39);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 40);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 41);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 42);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 43);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 44);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 45);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 46);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 47);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;

            question = db.Questions
               .Include(t => t.Answers)
               .FirstOrDefault(t => t.Question_id == 48);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            temp = new Answer { CorrectAnswer = "", Mark =  };
            db.Answers.Add(temp);
            question.Answers.Add(temp);
            db.Entry(question).State = EntityState.Modified;
            #endregion

            await db.SaveChangesAsync();
        }

    }
}
