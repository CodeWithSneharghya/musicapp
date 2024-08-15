import 'package:firstday/comps/song.dart';
import 'package:flutter/material.dart';

class Playlist extends ChangeNotifier {
  List<Song> playlistSource = [
    Song("Violet", "Connor Price and KILLA", "assets/img/violet.png", "assets/music/violet.mp3"),
    Song("The Spectre", "Alan Walker", "assets/img/spectre.jpg", "assets/music/spectre.mp3"),
    Song("Alone", "Marshmello", "assets/img/alone.jpg", "assets/music/alone.mp3")
  ];

  // current 
  int? current = 0;
  List<Song> get playlist => playlistSource;
  int? get currentIndex => current;

  set currentIndex(int? newIndex){
    current = newIndex;
    // to update the ui
    notifyListeners();
  }
}
