import 'package:firstday/about.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // adding elements to drawer
      child: Column(
        children: [
          // banner
          DrawerHeader(
              child: Center(
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                  'assets/img/music.png'), // Replace with your app logo
            ),
          )),
          // for HOME PAGE
          Padding(
            padding: EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () => Navigator.pop(context), // closes the drawer
            ),
          ),
          // FOR ABOUT PAGE
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0),
            child: ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
              onTap: () {
                // closes the drawer and redirect user to about page
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
