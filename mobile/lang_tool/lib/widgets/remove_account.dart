import 'package:flutter/material.dart';

class RemoveAccount extends StatefulWidget {
  RemoveAccount({Key key}) : super(key: key);

  @override
  _RemoveAccountState createState() => _RemoveAccountState();
}

class _RemoveAccountState extends State<RemoveAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Ви впевнені, що бажаєте видалити ваш обліковий запис? "
       "Це видалить усі дані, пов'язані з цим акаунтом (включаючи досягнення та прогрес). " 
       "Відмінити цю зміну після підтвердження неможливо.", textAlign: TextAlign.justify,),
    );
  }
}