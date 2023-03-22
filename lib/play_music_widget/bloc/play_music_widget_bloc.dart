import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_music_widget_event.dart';
part 'play_music_widget_state.dart';

class PlayMusicWidgetBloc extends Bloc<PlayMusicWidgetEvent, PlayMusicWidgetState> {
  PlayMusicWidgetBloc() : super(PlayMusicWidgetInitial()) {
    on<PlayMusicWidgetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
