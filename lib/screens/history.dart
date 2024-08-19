import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firstday/comps/playlist.dart';
import 'package:firstday/comps/song.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: Consumer<Playlist>(
        builder: (context, value, child) {
          // fetching the playlist
          List<Song> playlist = value.historyPlaylist;

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
                trailing: const Icon(Icons.history_outlined),
              );
            },
          );
        },
      ),
    );
  }
}
