
class SongModel {
  String id;
  String nameSong;
  String title;
  String code;
  int contentOwner;
  bool? isOffical;
  bool? isWorldWide;
  String playlistId;
  List<Artist> artists;

  String artistName;
  String performer;
  String link;
  String lyric;
  String thumbnail;
  int duration;
  int total;
  int? rankNum;
  Artist artist;
  int position;
  int order;
  Album album;

  SongModel(
      {required this.id,
      required this.nameSong,
      required this.title,
      required this.code,
      required this.contentOwner,
      this.isOffical,
      this.isWorldWide,
      required this.playlistId,
      required this.artists,
      required this.artistName,
      required this.performer,
      required this.link,
      required this.lyric,
      required this.thumbnail,
      required this.duration,
      required this.total,
       required this.rankNum,
      required this.artist,
      required this.position,
      required this.order,
      required this.album});
}

class Artist {
  String id;
  String? cover;
  String? thumbnail;
  String name;
  String? link;

  Artist(
      {required this.name,
      this.link,
      this.cover,
      required this.id,
      this.thumbnail});
}

class Album {
  String id;
  String link;
  String title;
  String name;
  bool? isOffical;
  String artistName;
  List<Artist> artists;

  Album(
      {required this.id,
      required this.link,
      required this.title,
      required this.name,
      this.isOffical,
      required this.artistName,
      required this.artists});
}
