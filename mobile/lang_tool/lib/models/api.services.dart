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
    var res = await http.put(Uri.parse(path), headers: header, body: studentBody);
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

    String path = "https://10.0.2.2:44352/achievements/getAchievement" + "/" + user_id.toString();
    Uri pathUri = Uri.parse(path);
    var resp = await http.get(pathUri);
    return resp;
  }
}
