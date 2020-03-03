import 'package:flutter/material.dart';
import 'package:foodi_app/screens/bottom_bar_screen.dart';
import 'package:foodi_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
//            Container(
//              height: 180,
//              width: double.infinity,
//              color: Theme.of(context).primaryColor,
//              child: Center(
//                child: Text(
//                  'Welcome, Foodies!',
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 32,
//                      fontFamily: 'Roboto',
//                      fontWeight: FontWeight.bold),
//                ),
//              ),
//            ),
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars3.githubusercontent.com/u/24526752?s=460&v=4'),
            ),
            accountName: Text('Manish Tuladhar'),
            accountEmail: Text('manish.eclipse@gmail.com'),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
            ),
            title: Text('Meals'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, BottomBarScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text('Filters'),
            onTap: () {
              Navigator.pushReplacementNamed(context, FilterScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
