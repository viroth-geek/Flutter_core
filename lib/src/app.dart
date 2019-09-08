import 'package:core/data_provider/user/counter.dart';
import 'package:core/service/requestService/get_user.dart';
import 'package:core/src/screen/tabs/Business.dart';
import 'package:core/src/screen/tabs/account_page.dart';
import 'package:core/src/screen/tabs/home_page.dart';
import 'package:core/src/screen/tabs/school_page.dart';
import 'package:core/src/screen/tabs/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
    Account(),
    Home(),
    Business(),
    School(),
    Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Counter()),
          ChangeNotifierProvider.value(value: GetUser())
        ],
        child: Scaffold(
          appBar: new AppBar(
            title: new Text(widget.title),
          ),
          body: IndexedStack(
            children: _widgetOptions,
            index: _selectedIndex,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Account"),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Business'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('School'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text("Setting"),
              ),
            ],
            unselectedItemColor: Colors.blue,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.teal,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ));
  }
}
