import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:lang_tool/models/user.dart';

class APIServices {
  static Uri studentUrl = Uri.parse("https://10.0.2.2:44352/users");

  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  static Future fetchUser() async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    return await http.get(studentUrl);
  }

  static Future<bool> postUser(User user) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    var myStudent = user.toMap();
    var studentBody = json.encode(myStudent);
    var res = await http.post(studentUrl, headers: header, body: studentBody);
    print(res.statusCode);
    return Future.value(res.statusCode == 200 ? true : false);
  }

  static Future<bool> getEmailUser(User user) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = studentUrl.toString() + "/" + user.email;

    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);

    if (resp.statusCode == 404) {
      return true;
    } else
      return false;

    //   if(await http.get(pathUri) == null){
    //     print ("NULL");
    //   } else print("Not Null");

    //   return await http.get(pathUri);

    //   var res = await http.get(studentUrl);

    //   print("Clicked!!!");
    //               http.get(Uri.parse('https://10.0.2.2:44352/test/users/qwe')).then((response) {
    //                 print("Response status: ${response.statusCode}");
    //                 print("Response body: ${response.body}");
    //                 if (response.statusCode == 404){
    //                   print("Null");
    //                 } else print("Not null");
    //               }).catchError((error) {
    //                 print("Error: $error");
    //               });
    // }
  }

  static Future fetchUserEmail(String email) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = studentUrl.toString() + "/" + email;
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future putUser(User user) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = studentUrl.toString() + "/" + user.id.toString();

    var myStudent = user.toMap();
    var studentBody = json.encode(myStudent);
    var res =
        await http.put(Uri.parse(path), headers: header, body: studentBody);
    print(res.statusCode);
    return Future.value(res.statusCode == 200 ? true : false);
  }

  static Future delUser(User user) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = studentUrl.toString() + "/" + user.email.toString();
    var res = await http.delete(Uri.parse(path));
    print(res.statusCode);
    return Future.value(res.statusCode == 200 ? true : false);
  }

  static Future fetchUserAchievement(int user_id) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    // /achievementsgetAchievement/{User_id}

    String path = "https://10.0.2.2:44352/achievements/getAchievement" +
        "/" +
        user_id.toString();
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future fetchQuestions(String name) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = "https://10.0.2.2:44352/questions" + "/" + name;
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future fetchAnswers(String question) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = "https://10.0.2.2:44352/questions/answers" + "/" + question;
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future postAnswers(
      String testName, String userId, List<String> answer) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    // String aboba = answer.toString();
    // aboba = "#" + aboba;
    String path = "https://10.0.2.2:44352/tests/checkTest" +
        "/" +
        testName +
        "/" +
        userId;
    var studentBody = json.encode(answer);
    var res =
        await http.post(Uri.parse(path), headers: header, body: studentBody);
    print(res.statusCode);
    print(res.body);
    return res;
    return Future.value(res.statusCode == 200 ? true : false);
  }

  static Future fetchPassedTests(int userId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = "https://10.0.2.2:44352/users/statistics/getPassedTests" +
        "/" +
        userId.toString();
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future fetchGainedAchievements(int userId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path =
        "https://10.0.2.2:44352/users/statistics/getGainedAchievements" +
            "/" +
            userId.toString();
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future fetchCompletedTopics(int userId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = "https://10.0.2.2:44352/users/statistics/getCompletedTopics" +
        "/" +
        userId.toString();
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future fetchTotalLearnedPhrases(int userId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path =
        "https://10.0.2.2:44352/users/statistics/getTotalLearnedPhrases" +
            "/" +
            userId.toString();
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future fetchAlphabetProgress(int userId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path =
        "https://10.0.2.2:44352/users/statistics/getAlphabetProgress" +
            "/" +
            userId.toString();
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future fetchTests() async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = "https://10.0.2.2:44352/tests";
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    // print(resp.statusCode);
    // print(resp.body);
    return resp;
  }

  static Future postDeadline(Map<String, dynamic> deadLine, int userId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    // String aboba = answer.toString();
    // aboba = "#" + aboba;
    String path =
        "https://10.0.2.2:44352/users/deadlines" + "/" + userId.toString();
    var studentBody = json.encode(deadLine);
    var res =
        await http.post(Uri.parse(path), headers: header, body: studentBody);
    print(res.statusCode);
    print(res.body);
    return res;
    return Future.value(res.statusCode == 200 ? true : false);
  }

  static Future fetchDeadlines(int id) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = "https://10.0.2.2:44352/users/deadlines/" + id.toString();
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    // print(resp.statusCode);
    // print(resp.body);
    return resp;
  }

  static Future delDeadline(int id) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    String path = "https://10.0.2.2:44352/users/deadlines/" + id.toString() + "/false";
    var res = await http.delete(Uri.parse(path));
    print(res.statusCode);
    return Future.value(res.statusCode == 200 ? true : false);
  }

  static Future fetchPhrases(String topicName) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    // /achievementsgetAchievement/{User_id}

    String path = "https://10.0.2.2:44352/phrases/getByTopic" + "/" + topicName;
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future getAchievementComplteTopic(String topicName, int userId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    // /achievementsgetAchievement/{User_id}

    String path =
        "https://10.0.2.2:44352/phrases/completeTopic/$topicName/$userId";
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future getChangeThemeAchievement(int userId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    // /achievementsgetAchievement/{User_id}

    String path =
        "https://10.0.2.2:44352/achievements/changeThemeAchievement/$userId";
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }

  static Future getUserAccessTets(String testName, int userId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    // /achievementsgetAchievement/{User_id}

    String path = "https://10.0.2.2:44352/testusers/$testName/$userId";
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }
}
