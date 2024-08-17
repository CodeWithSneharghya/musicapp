import 'package:firstday/comps/playlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SongUI extends StatelessWidget {
  const SongUI({super.key});

  // convert time to min and seconds
  String formatTime(Duration duration){
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String result = "${duration.inMinutes}:$seconds";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Playlist>(builder: (context, value, child) {
      // playlist
      final playlist = value.playlist;

      // current song
      final current = playlist[value.currentIndex ?? 0];
      return Scaffold(
        appBar: AppBar(
          title: const Text("Music Player"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // album box
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Album Picture 
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey, // Placeholder color
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                            current.image), 
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), 
                  // Song Name
                  Text(
                    current.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Artist Name
                  Text(
                    current.artist,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // slider time control
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Start Time
                  Text(formatTime(value.currentDuration)),
                  // Repeat Button 
                  IconButton(
                    icon: const Icon(Icons.restart_alt_rounded),
                    onPressed: () {
                      // Handle repeat action
                      value.resetDuration();
                    },
                  ),

                  // End Time
                  Text(formatTime(value.totalDur)),
                ],
              ),
            ),
            SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0)),
                child: Slider(
                    value: value.currentDuration.inSeconds.toDouble(),
                    min: 0,
                    max: value.totalDur.inSeconds.toDouble(),
                    activeColor: Colors.greenAccent,
                    onChanged: (double double) {
                      
                      value.seek(Duration(seconds: double.toInt()));
                    },
                    onChangeEnd:(double double) {
                    },))
            // controls
            ,
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle previous track action
                      value.playPrev();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 4, 
                      shape: const CircleBorder(), 
                      padding: const EdgeInsets.all(16), 
                    ),
                    child: const Icon(Icons.skip_previous),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle play/pause action
                      value.toggleState();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 4, 
                      shape: const CircleBorder(), 
                      padding: const EdgeInsets.all(20), 
                    ),
                    child: Icon(value.isPlaying ? Icons.pause : Icons.play_arrow),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle next track action
                      value.playNext();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 4, 
                      shape: const CircleBorder(), 
                      padding: const EdgeInsets.all(16), 
                    ),
                    child: const Icon(Icons.skip_next),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
