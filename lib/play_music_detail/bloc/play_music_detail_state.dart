part of 'play_music_detail_bloc.dart';

class PlayMusicDetailState extends Equatable {
  final bool isPlayMusic;
  final String? time;

  const PlayMusicDetailState({this.isPlayMusic = false, this.time});

  PlayMusicDetailState copyWith({
    bool? isPlayMusic,
    String? time
  }) {
    return PlayMusicDetailState(isPlayMusic: isPlayMusic ?? this.isPlayMusic);
  }

  @override
  List<Object?> get props => [
    isPlayMusic,
  ];
}