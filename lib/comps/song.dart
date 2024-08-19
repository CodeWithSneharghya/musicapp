// class song with name, artist etc.

class Song {
  String name;
  String artist;
  String image;
  String audio;
  bool like;
  // constructor
  Song(this.name, this.artist, this.image, this.audio, {this.like = false});
}