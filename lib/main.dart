import 'package:flutter/material.dart';
import 'package:firstday/comps/myDrawer.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your App Title',
          theme: ThemeData(primarySwatch: Colors.amber),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: Home(),
        );
      },
    );
  }
}

// home page
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // uses the current theme
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Music"),
        // right theme toggler button
         actions: [ 
          // adding some padding 
          Padding(padding: const EdgeInsets.only(right: 10),
          child: IconButton( 
            icon: Icon(Main.themeNotifier.value == ThemeMode.light 
                ? Icons.dark_mode 
                : Icons.light_mode), 
            onPressed: () { 
              Main.themeNotifier.value = Main.themeNotifier.value == ThemeMode.light 
                  ? ThemeMode.dark 
                  : ThemeMode.light; 
            }, 
          ),) 
        ], 
      ),
      // a drawer imported from comps
      drawer: Mydrawer(),
    );
  }
}
