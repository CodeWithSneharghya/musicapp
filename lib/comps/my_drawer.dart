import 'package:firstday/about.dart';
import 'package:firstday/account.dart';
import 'package:firstday/liked.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// using shared_preferences to store data in local storage
class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawer();
}
class _MyDrawer extends State<MyDrawer> {
  // username and email
  String _username = '';
  String _email = '';
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
      _email = prefs.getString('email') ?? '';
    });
  }
  // init the state in stateful widget
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }


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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/img/music.png'),
            ),
            Text("Hi $_username", style: const TextStyle(fontSize: 20),),
            Text(_email, style: const TextStyle(color: Colors.grey, fontSize: 15),)
              ],
            )
          )),
          // for HOME PAGE
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 25),
            child: ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: () => Navigator.pop(context), // closes the drawer
            ),
          ),
          // liked songs
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ListTile(
              title: const Text("Liked Songs"),
              leading: const Icon(Icons.favorite),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Liked()));
              }, // closes the drawer
            ),
          ),
          // liked songs
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ListTile(
              title: const Text("History"),
              leading: const Icon(Icons.history),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Liked()));
              }, // closes the drawer
            ),
          ),
          // user info
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ListTile(
              title: const Text("Account"),
              leading: const Icon(Icons.account_box),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()));
              }, // closes the drawer
            ),
          ),
          // FOR ABOUT PAGE
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ListTile(
              title: const Text("About"),
              leading: const Icon(Icons.info),
              onTap: () {
                // closes the drawer and redirect user to about page
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
