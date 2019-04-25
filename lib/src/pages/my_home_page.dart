import 'package:flutter/material.dart';
// we are injecting the bloc here
import '../bloc/bloc.dart';
import './page_one.dart';
import './page_two.dart';
import './home_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Bloc Sample'),
      ),
      drawer: buildDrawer(),
      body: StreamBuilder<String>(
        stream: bloc.getNavigation,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == "Home") {
              return Home();
            }

            if (snapshot.data == 'PageOne') {
              return PageOne();
            }

            if (snapshot.data == 'PageTwo') {
              return PageTwo();
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Admin'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            accountEmail: Text('123123@gmail.com'),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              bloc.setNavigation("Home");
            },
          ),
          ListTile(
            title: Text("Page One"),
            onTap: () {
              Navigator.of(context).pop();
              bloc.setNavigation("PageOne");
            },
          ),
          ListTile(
            title: Text("Page Two"),
            onTap: () {
              Navigator.of(context).pop();

              bloc.setNavigation("PageTwo");
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
