
import 'package:firstday/comps/playlist.dart';
import 'package:firstday/screens/song_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firstday/comps/song.dart';

class Liked extends StatelessWidget {
  const Liked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liked songs"),
      ),
      body: Consumer<Playlist>(
        builder: (context, value, child) {
          late final dynamic playListSource;
          playListSource = Provider.of<Playlist>(context, listen: false);
          // fetching the playlist
          List<Song> playlist = value.playlist;
          void navigate(int index) {
            // update the index
            playListSource.currentIndex = index;
            // go to the song page
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SongUI()));
          }

          // this creates list view
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              // get each song
              final Song song = playlist[index];
              // return the UI
              return song.like ? ListTile(
                title: Text(song.name),
                subtitle: Text(song.artist),
                leading: Image.asset(song.image),
                trailing: const Icon(Icons.favorite),
                onTap: () => navigate(index),
              ) : const SizedBox();
            },
          );
        },
      ),
    );
  }
}
