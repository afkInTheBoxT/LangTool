import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lang_tool/widgets/main_menu_nav.dart';
import 'package:lang_tool/pages/account_page.dart';

class MainPages {
  final String title;
  final IconData icon;
  final Widget wdg;

  MainPages({
    @required this.title, 
    @required this.icon,
    @required this.wdg,
    });
}


  // final _data = [
  //   MainPages(title: 'Навчання', icon: Icons.menu_book_rounded, wdg: Pages1()),
  //   MainPages(title: 'Акаунт', icon: Icons.person, wdg: Pages2()),
  //   MainPages(title: 'Навчання', icon: Icons.menu_book_rounded, wdg: Pages1()),
  // ];
  final _kpages = <Widget>[
    MainMenuNav(),
    AccountPage(),
    MainMenuNav(),
  ];


const _kPages = <String, IconData>{
  'Навчання': Icons.menu_book_rounded,
  'Акаунт': Icons.person,
  // 'add': Icons.add,
  'Налаштування': Icons.settings,
  // 'people': Icons.people,
};

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}
TabStyle _tabStyle = TabStyle.reactCircle;
class _MainPageState extends State<MainPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
        title: Center(
          child: Text(
            'LangTool',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor: Colors.orange[400],
      ),
        body: TabBarView(children: _kpages),
        bottomNavigationBar: ConvexAppBar.badge(
          // Optional badge argument: keys are tab indices, values can be
          // String, IconData, Color or Widget.
          /*badge=*/ const <int, dynamic>{0: ''},
          style: _tabStyle,
          backgroundColor: Colors.orange[400],
          items: <TabItem>[
            for (final entry in _kPages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }

  // Select style enum from dropdown menu:
  // Widget _buildStyleSelector() {
  //   final dropdown = DropdownButton<TabStyle>(
  //     value: _tabStyle,
  //     onChanged: (newStyle) {
  //       setState(() => _tabStyle = newStyle);
  //     },
  //     items: [
  //       for (final style in TabStyle.values)
  //         DropdownMenuItem(
  //           value: style,
  //           child: Text(style.toString()),
  //         )
  //     ],
  //   );
  //   return ListTile(
  //     contentPadding: const EdgeInsets.all(8),
  //     title: const Text('appbar style:'),
  //     trailing: dropdown,
  //   );
  // }
}