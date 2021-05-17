import 'package:flutter/material.dart';
import 'package:lang_tool/widgets/main_menu_nav.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.teal,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/1.jpg'),
                    radius: 58,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 30,
                      child: Text(
                        'Name',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 120,
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        //   Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Container(
        //   margin: const EdgeInsets.only(top: 20),
        //   width: 200,
        //   height: 60,
        //   decoration: BoxDecoration(
        //     color: Colors.orange[400],
        //     borderRadius: BorderRadius.circular(15),
        //   ),
        //   child: FlatButton(
        //     onPressed: () {
        //       // Navigator.pop(context);
        //       // Navigator.push(
        //       //   context,
        //       //   MaterialPageRoute(builder: (context) => AplgabetPage()),
        //       // );
        //     },
        //     child: Text(
        //       'Досягнення',
        //       style: TextStyle(
        //         fontSize: 20,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        //     ],
        //   ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text('Досягнення'),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 320,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange[400], width: 3),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ListView(
                    children: <Widget>[
                      // MainMenuNav(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
