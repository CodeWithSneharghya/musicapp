import 'package:audioplayers/audioplayers.dart';
import 'package:firstday/comps/song.dart';
import 'package:flutter/material.dart';

class Playlist extends ChangeNotifier {
  List<Song> playlistSource = [
    Song("The Spectre", "Alan Walker", "assets/img/spectre.jpg",
        "music/spectre.mp3", like: true),
    Song("Violet", "Connor Price and KILLA", "assets/img/violet.png",
        "music/violet.mp3"),
    Song("Alone", "Marshmello", "assets/img/alone.jpg", "music/alone.mp3")
  ];
  // current
  int? current = -1;
  int? curInst = -1; // to check if current song is same as clicked
  // audio player
  final AudioPlayer aud = AudioPlayer();
  // duration
  Duration curDur = Duration.zero;
  Duration totalDur = Duration.zero;
  Playlist() {
    listenToDuration();
  }
  bool _isPlaying = false;
  // to play the song
  void play() async {
    try {
      final String path = playlistSource[currentIndex!].audio;
      // if current song is tapped resume else play new
      if (currentIndex == curInst) {
        aud.seek(curDur + Durations.short4); // added to fix peaks
      } else {
        // stop all audio before playing
        await aud.stop();
        // then play the main audio
        await aud.play(AssetSource(path));

        _isPlaying = true;
      }
      curInst = currentIndex;
      notifyListeners();
    } catch (e) {
      // Handle the error
      // ignore: avoid_print
      print('Error playing audio: $e');
    }
  }

  // to pause the song
  void pause() async {
    await aud.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // to resume the song
  void resume() async {
    await aud.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // to seek through slider
  void seek(Duration pos) async {
    await aud.seek(pos); // seek to that position
  }

  // play the next song
  void playNext() async {
    // as long as valid and not the last song add 1
    if (currentIndex != null && currentIndex! < playlistSource.length - 1) {
      currentIndex = currentIndex! + 1;
    } else {
      // go back to first song
      currentIndex = 0;
    }
  }

  // playing the previous song
  void playPrev() async {
    // play from beginning if more than 2s passed
    if (currentIndex! > 0) {
      currentIndex = currentIndex! - 1;
    } else {
      // if it is first song then move to last song
      currentIndex = playlistSource.length - 1;
    }
  }

  // reset the duration when reset button is pressed
  void resetDuration() async {
    seek(Duration.zero);
  }

  // toggleling pause and resume
  void toggleState() async {
    if (_isPlaying) {
      pause(); // if its playing pause it
    } else {
      resume();
    }
    notifyListeners();
  }

  // add to Liked songs or remove
  void addToLiked() {
    if (playlistSource[currentIndex!].like) {
      playlistSource[currentIndex!].like = false;
    } else {
      playlistSource[currentIndex!].like = true;
    }
  }

  //listen to duration
  void listenToDuration() {
    // notifyListeners to update the values
    // total
    aud.onDurationChanged.listen((newDuration) {
      totalDur = newDuration;
      notifyListeners();
    });
    // current
    aud.onPositionChanged.listen((newPos) {
      curDur = newPos;
      notifyListeners();
    });
    // completed
    aud.onPlayerComplete.listen((event) {
      playNext();
      notifyListeners();
    });
  }

  // using getters to get and pass value in other components
  List<Song> get playlist => playlistSource;
  int? get currentIndex => current;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => curDur;
  Duration get totalDuration => totalDur;

  set currentIndex(int? newIndex) {
    current = newIndex;
    if (newIndex != null) {
      play();
    }
    // to update the ui
    notifyListeners();
  }
}
