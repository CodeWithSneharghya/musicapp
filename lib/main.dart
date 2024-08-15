import 'package:firstday/comps/playlist.dart';
import 'package:firstday/songUI.dart';
import 'package:flutter/material.dart';
import 'package:firstday/comps/myDrawer.dart';
import 'package:provider/provider.dart';
import 'package:firstday/comps/song.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Playlist(),
    )
  ],
  child: const Main(),));
}

class Main extends StatelessWidget {
  const Main({super.key});
  // it notifies its listeners when the value changes
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
          theme: ThemeData(fontFamily: 'poppins'),
          darkTheme:
              ThemeData(fontFamily: 'poppins', brightness: Brightness.dark),
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
    late final dynamic playListSource;
    playListSource = Provider.of<Playlist>(context, listen: false);
    // navigating to a song
    void navigate(int index){
      // update the index
      playListSource.currentIndex = index;

      // go to the song page
      Navigator.push(context, MaterialPageRoute(builder: (context) => SongUI()));
    }

    return Scaffold(
      // uses the current theme
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Music"),
        // right theme toggler button
        backgroundColor: Main.themeNotifier.value == ThemeMode.light
            ? Color.fromARGB(255, 170, 216, 0) // Light mode color
            : Color.fromARGB(255, 79, 100, 0), // Dark mode color
        actions: [
          // adding some padding
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Main.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                Main.themeNotifier.value =
                    Main.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              },
            ),
          )
        ],
      ),
      // a drawer imported from comps
      drawer: Mydrawer(),
      body: Consumer<Playlist>(
        builder: (context, value, child) {
          // fetching the playlist
          List<Song> playlist = value.playlist;

          // this creates list view
          return ListView.builder(
            itemCount: playlist.length,
          itemBuilder: (context, index) {
            // get each song
            final Song song = playlist[index];
            // return the UI 
            return ListTile(
              title: Text(song.name),
              subtitle: Text(song.artist),
              leading: Image.asset(song.image),
              onTap: () => navigate(index),

            );
          },
        );
        } ,
      ),
    );
  }
}
