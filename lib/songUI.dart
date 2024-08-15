import 'package:firstday/comps/playlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SongUI extends StatelessWidget {
  const SongUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Playlist>(builder: (context, value, child) {
      // playlist
      final playlist = value.playlist;

      // current song
      final current = playlist[value.currentIndex ?? 0];
      return Scaffold(
        appBar: AppBar(
          title: Text("Music UI"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // album box
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Album Picture (Centered)
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey, // Placeholder color
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                            current.image), // Replace with your album image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Add spacing between elements
                  // Song Name
                  Text(
                    current.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Artist Name
                  Text(
                    current.artist,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
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
                  Text('10:00 AM'), // Replace with actual start time

                  // Shuffle Button (you can use an IconButton or any widget)
                  IconButton(
                    icon: Icon(Icons.shuffle),
                    onPressed: () {
                      // Handle shuffle action
                    },
                  ),

                  // Repeat Button (you can use an IconButton or any widget)
                  IconButton(
                    icon: Icon(Icons.repeat),
                    onPressed: () {
                      // Handle repeat action
                    },
                  ),

                  // End Time
                  Text('11:30 AM'), // Replace with actual end time
                ],
              ),
            ),
            SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0)),
                child: Slider(
                    value: 50,
                    min: 0,
                    max: 100,
                    activeColor: Colors.greenAccent,
                    onChanged: (value) {}))
            // controls
            ,
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle previous track action
                    },
                    child: Icon(Icons.skip_previous),
                    style: ElevatedButton.styleFrom(
                      elevation: 4, // Add elevation
                      shape: CircleBorder(), // Make it circular
                      padding: EdgeInsets.all(16), // Increase size
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle play/pause action
                    },
                    child: Icon(Icons.play_arrow),
                    style: ElevatedButton.styleFrom(
                      elevation: 4, // Add elevation
                      shape: CircleBorder(), // Make it circular
                      padding: EdgeInsets.all(20), // Increase size
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle next track action
                    },
                    child: Icon(Icons.skip_next),
                    style: ElevatedButton.styleFrom(
                      elevation: 4, // Add elevation
                      shape: CircleBorder(), // Make it circular
                      padding: EdgeInsets.all(16), // Increase size
                    ),
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
