import 'package:flutter/material.dart';
import 'package:firstday/comps/playlist.dart';
import 'package:provider/provider.dart';
import 'package:firstday/comps/song.dart';
import 'package:firstday/screens/song_ui.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});
  String formatTime(Duration duration) {
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String result = "${duration.inMinutes}:$seconds";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    void navigate(int index) {
      late final dynamic playListSource;
      playListSource = Provider.of<Playlist>(context, listen: false);
      // update the index
      playListSource.currentIndex = index;
      // go to the song page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SongUI()));
    }

    return Consumer<Playlist>(builder: (context, value, child) {
      List<Song> list = value.playlist;
      int? index = value.currentIndex;
      if (index != -1) {
        Song currentSong = list[index!];
        return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 45, 246, 0).withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    child: Row(
                      children: [
                        Image.asset(currentSong.image),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentSong.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              currentSong.artist,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Replace with your play/pause button
                        Text(formatTime(value.currentDuration)),
                        const Spacer(),
                        IconButton.filled(
                            onPressed: () => value.toggleState(),
                            icon: Icon(value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow)),
                      ],
                    ),
                    onTap: () => navigate(index),
                  )),
            ));
      } else {
        return const Text("");
      }
    });
  }
}
