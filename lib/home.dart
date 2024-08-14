import 'package:firstday/comps/myDrawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // uses the current theme
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Music"),
      ),
      // a drawer imported from comps
      drawer: Mydrawer(),
    );
  }
}