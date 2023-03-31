import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/SongModel.dart';

part 'play_music_detail_event.dart';
part 'play_music_detail_state.dart';

class PlayMusicDetailBloc extends Bloc<PlayMusicDetailEvent, PlayMusicDetailState> {
  PlayMusicDetailBloc() : super(const PlayMusicDetailState()) {
    on<PlayMusicEvent>(_onPlayMusic);
  }

  void _onPlayMusic(PlayMusicEvent event, Emitter<PlayMusicDetailState> emit){

  }
}
