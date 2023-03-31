part of 'play_music_detail_bloc.dart';

abstract class PlayMusicDetailEvent extends Equatable{
  const PlayMusicDetailEvent();
  @override
  List<Object?> get props => [];
}

class PlayMusicEvent extends PlayMusicDetailEvent{
  final bool isPlayMusic;
 const PlayMusicEvent({required this.isPlayMusic});
}
