import 'package:firstday/comps/mini_player.dart';
import 'package:firstday/comps/playlist.dart';
import 'package:firstday/song_ui.dart';
import 'package:flutter/material.dart';
import 'package:firstday/comps/my_drawer.dart';
import 'package:provider/provider.dart';
import 'package:firstday/comps/song.dart';

void main() {
  // to mamane states it is used here
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Playlist(),
      )
    ],
    child: const Main(),
  ));
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
          home: const Home(),
        );
      },
    );
  }
}

// home page
class Home extends StatelessWidget {
  // convert time to min and seconds
  String formatTime(Duration duration){
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String result = "${duration.inMinutes}:$seconds";
    return result;
  }
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    late final dynamic playListSource;
    playListSource = Provider.of<Playlist>(context, listen: false);
    // navigating to a song
    void navigate(int index) {
      // update the index
      playListSource.currentIndex = index;
      // go to the song page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SongUI()));
    }

    return Scaffold(
      // uses the current theme
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("MusicApp"),
        // right theme toggler button
        backgroundColor: Main.themeNotifier.value == ThemeMode.light
            ? const Color.fromARGB(255, 170, 216, 0) // Light mode color
            : const Color.fromARGB(255, 79, 100, 0), // Dark mode color
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
      drawer: const Mydrawer(),
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
                trailing: song.like ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_outline),
                onTap: () => navigate(index),
              );
            },
          );
        },
      ),
      // miniplayer
      bottomNavigationBar: const MiniPlayer(),
    );
  }
}
