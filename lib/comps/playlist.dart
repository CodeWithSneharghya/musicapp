import 'package:firstday/comps/song.dart';
import 'package:flutter/material.dart';

class Playlist extends ChangeNotifier {
  List<Song> playlistSource = [
    Song("Never", "Rick", "assets/img/music.png", "assets/music/rick.mp3"),
    Song("dg", "Ricgdhk", "assets/img/music.png", "assets/music/rick.mp3"),
    Song("dg", "Ricgdhk", "assets/img/music.png", "assets/music/rick.mp3"),
    Song("dg", "Ricgdhk", "assets/img/music.png", "assets/music/rick.mp3"),
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
