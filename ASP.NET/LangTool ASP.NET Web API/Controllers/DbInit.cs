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
            AddAnswers(db);
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
                    //User_id = 1,
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
                    //User_id = 2,
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
                    //User_id = 3,
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
                    //User_id = 4,
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
                db.Tests.Add(new Test { TestName = "Їжа", TotalMark = 10 });
                db.Tests.Add(new Test { TestName = "Транспорт", TotalMark = 15 });
                db.Tests.Add(new Test { TestName = "Питання", TotalMark = 15 });
                db.Tests.Add(new Test { TestName = "Дати", TotalMark = 15 });
                db.Tests.Add(new Test { TestName = "Кольори", TotalMark = 15 });
                db.Tests.Add(new Test { TestName = "Природа", TotalMark = 15 });
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

        public static void AddQuestions(Context db)
        {
            if (!db.Questions.Any())
            {
                var test = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.TestName == "Їжа");
                Question temp = new Question { QuestionName = "Переведіть вираз パンを食べる", Multiplyer = 1 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 石油を買いたい", Multiplyer = 2 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question {  QuestionName = "Переведіть вираз チーズがない", Multiplyer = 2 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question {  QuestionName = "Переведіть вираз 彼はサンドイッチを作りたい", Multiplyer = 5 };
                db.Questions.Add(temp);                
                test.Questions.Add(temp);

                db.SaveChanges();

                test = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.TestName == "Транспорт");
                temp = new Question { QuestionName = "Переведіть вираз 自転車に乗る", Multiplyer = 2 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 彼はオートバイを買った", Multiplyer = 3 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз お母さんはよくバスを利用します", Multiplyer = 5 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 彼らは車に乗る", Multiplyer = 5 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                db.Entry(test).State = EntityState.Modified;

                db.SaveChanges();

                test = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.TestName == "Питання");
                temp = new Question { QuestionName = "Переведіть вираз お名前は何ですか", Multiplyer = 2 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз あなたは何歳ですか", Multiplyer = 4 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз それはどれくらいしますか", Multiplyer = 5 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз それは何色です", Multiplyer = 4 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                db.Entry(test).State = EntityState.Modified;

                db.SaveChanges();

                test = db.Tests
                 .Include(t => t.Questions)
                 .FirstOrDefault(t => t.TestName == "Дати");
                temp = new Question { QuestionName = "Переведіть вираз 今日は水曜日です", Multiplyer = 3 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 明日は6月12日", Multiplyer = 3 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 昨日は月曜日", Multiplyer = 2 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 私は最初の年に2000人生まれ", Multiplyer = 7 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                db.Entry(test).State = EntityState.Modified;

                db.SaveChanges();

                test = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.TestName == "Кольори");
                temp = new Question { QuestionName = "Переведіть вираз 庭の黄色い太陽", Multiplyer = 3 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 彼女のブラウスは真っ赤です", Multiplyer = 5 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз ホワイトトップ、ブラックボトム", Multiplyer = 5 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 母の目は緑", Multiplyer = 2 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                db.Entry(test).State = EntityState.Modified;

                db.SaveChanges();

                test = db.Tests
                .Include(t => t.Questions)
                .FirstOrDefault(t => t.TestName == "Природа");
                temp = new Question { QuestionName = "Переведіть вираз 賢いoの木です", Multiplyer = 2 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 新年には、私の家族は緑のクリスマス ツリーを置きます", Multiplyer = 8 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз 女の子はバラが大好き", Multiplyer = 2 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                temp = new Question { QuestionName = "Переведіть вираз この花はいいにおいがする", Multiplyer = 3 };
                db.Questions.Add(temp);
                test.Questions.Add(temp);
                db.Entry(test).State = EntityState.Modified;
            }
            db.SaveChanges();
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
            }
            db.SaveChanges();
        }

        public static async void AddAnswers(Context db)
        {
            if (!db.Answers.Any())
            {
                #region Food

                var question = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз パンを食べる");
                var temp = new Answer { CorrectAnswer = "Я їм хліб", Mark = 1 };
                //db.Answers.Add(temp);
                question.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Я хліб", Mark = 0 };
                //db.Answers.Add(temp);
                question.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Ти їш хліб", Mark = 0 };
                //db.Answers.Add(temp);
                question.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Я їм бутерброд", Mark = 0 };
                //db.Answers.Add(temp);
                question.Answers.Add(temp);
                db.Entry(question).State = EntityState.Modified;

                db.SaveChanges();

                var question1 = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз 石油を買いたい");
                temp = new Answer { CorrectAnswer = "Я куплю сир", Mark = 0 };
                //db.Answers.Add(temp);
                question1.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "В мене немає сиру", Mark = 1 };
                //db.Answers.Add(temp);
                question1.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "В мене немає картошки", Mark = 0 };
                //db.Answers.Add(temp);
                question1.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "В мене є сир", Mark = 0 };
                //db.Answers.Add(temp);
                question1.Answers.Add(temp);
                db.Entry(question1).State = EntityState.Modified;

                db.SaveChanges();

                var question2 = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз チーズがない");
                temp = new Answer { CorrectAnswer = "Я візьму масло", Mark = 0 };
                //db.Answers.Add(temp);
                question2.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Я роблю бутерброд с маслом", Mark = 0 };
                //db.Answers.Add(temp);
                question2.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Він хоче купити масло", Mark = 0 };
                //db.Answers.Add(temp);
                question2.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Я хочу купить масло", Mark = 1 };
                //db.Answers.Add(temp);
                question2.Answers.Add(temp);
                db.Entry(question2).State = EntityState.Modified;

                db.SaveChanges();

                var question3 = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз 彼はサンドイッチを作りたい");
                temp = new Answer { CorrectAnswer = "Він хоче приготовить бутерброд", Mark = 1 };
                //db.Answers.Add(temp);
                question3.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Я хочу приготовить суп", Mark = 0 };
                //db.Answers.Add(temp);
                question3.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Вмене не має бутерброду", Mark = 0 };
                //db.Answers.Add(temp);
                question3.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Вона приготовила суп", Mark = 0 };
                //db.Answers.Add(temp);
                question3.Answers.Add(temp);
                db.Entry(question3).State = EntityState.Modified;

                db.SaveChanges();

                var question4 = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз 自転車に乗る");
                temp = new Answer { CorrectAnswer = "Мама купить мені велосипед", Mark = 0 };
                //db.Answers.Add(temp);
                question4.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Він їде на велосипеді", Mark = 0 };
                //db.Answers.Add(temp);
                question4.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Я їду на велосипеді", Mark = 1 };
                //db.Answers.Add(temp);
                question4.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Вони купують велосипед", Mark = 0 };
                //db.Answers.Add(temp);
                question4.Answers.Add(temp);
                db.Entry(question4).State = EntityState.Modified;

                db.SaveChanges();

                var question5 = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз 彼はオートバイを買った");
                temp = new Answer { CorrectAnswer = "Він купив авто", Mark = 0 };
                //db.Answers.Add(temp);
                question5.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Вони катаються на авто", Mark = 1 };
                //db.Answers.Add(temp);
                question5.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Я замовив таксі", Mark = 0 };
                //db.Answers.Add(temp);
                question5.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Вони орендували авто", Mark = 0 };
                //db.Answers.Add(temp);
                question5.Answers.Add(temp);
                db.Entry(question5).State = EntityState.Modified;

                db.SaveChanges();

                var question6 = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз お母さんはよくバスを利用します");
                temp = new Answer { CorrectAnswer = "Мама часто користується автобусом", Mark = 1 };
                //db.Answers.Add(temp);
                question6.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Я їду на автобусі", Mark = 0 };
                //db.Answers.Add(temp);
                question6.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Вона користується автобусом", Mark = 0 };
                //db.Answers.Add(temp);
                question6.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Він часто користується автобусом", Mark = 0 };
                //db.Answers.Add(temp);
                question6.Answers.Add(temp);
                db.Entry(question6).State = EntityState.Modified;

                db.SaveChanges();

                var question7 = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз 彼らは車に乗る");
                temp = new Answer { CorrectAnswer = "Він купив мотоцикл", Mark = 1 };
                //db.Answers.Add(temp);
                question7.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Папа купив мотоцикл", Mark = 0 };
                //db.Answers.Add(temp);
                question7.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Я катаюсь на авто", Mark = 0 };
                //db.Answers.Add(temp);
                question7.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Він розбив авто", Mark = 0 };
                //db.Answers.Add(temp);
                question7.Answers.Add(temp);
                db.Entry(question7).State = EntityState.Modified;

                db.SaveChanges();

                var question8 = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз お名前は何ですか");
                temp = new Answer { CorrectAnswer = "Як тебе звати?", Mark = 1 };
                //db.Answers.Add(temp);
                question8.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Як справи?", Mark = 0 };
                //db.Answers.Add(temp);
                question8.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Звідки ти?", Mark = 0 };
                //db.Answers.Add(temp);
                question8.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Котра година?", Mark = 0 };
                //db.Answers.Add(temp);
                question8.Answers.Add(temp);
                db.Entry(question8).State = EntityState.Modified;

                db.SaveChanges();

                var question9 = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз あなたは何歳ですか");
                temp = new Answer { CorrectAnswer = "Який в тебе ріст?", Mark = 0 };
                //db.Answers.Add(temp);
                question9.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Скільки років твоїй мамі?", Mark = 0 };
                //db.Answers.Add(temp);
                question9.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Скільки тобі років?", Mark = 1 };
                //db.Answers.Add(temp);
                question9.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Скільки років твоєму тату?", Mark = 0 };
                //db.Answers.Add(temp);
                question9.Answers.Add(temp);
                db.Entry(question9).State = EntityState.Modified;

                db.SaveChanges();

                var question10 = db.Questions
                    .Include(t => t.Answers)
                    .FirstOrDefault(t => t.QuestionName == "Переведіть вираз それはどれくらいしますか");
                temp = new Answer { CorrectAnswer = "Скільки це коштує?", Mark = 1 };
                //db.Answers.Add(temp);
                question10.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Скільки ти заплатив?", Mark = 0 };
                //db.Answers.Add(temp);
                question10.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Як називається ця річ?", Mark = 0 };
                //db.Answers.Add(temp);
                question10.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Скільки коштує ця річ?", Mark = 0 };
                //db.Answers.Add(temp);
                question10.Answers.Add(temp);
                db.Entry(question10).State = EntityState.Modified;
                
                db.SaveChanges();

                var question11 = db.Questions
                   .Include(t => t.Answers)
                   .FirstOrDefault(t => t.QuestionName == "Переведіть вираз それは何色です");
                temp = new Answer { CorrectAnswer = "Який твій любимий колір?", Mark = 0 };
                //db.Answers.Add(temp);
                question11.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Якого кольру сонце?", Mark = 0 };
                //db.Answers.Add(temp);
                question11.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Який це колір?", Mark = 1 };
                //db.Answers.Add(temp);
                question11.Answers.Add(temp);
                temp = new Answer { CorrectAnswer = "Якого кольру твої очі?", Mark = 0 };
                //db.Answers.Add(temp);
                question11.Answers.Add(temp);
                db.Entry(question11).State = EntityState.Modified;

                db.SaveChanges();
                #endregion

            }

            db.SaveChanges();
        }

    }
}
