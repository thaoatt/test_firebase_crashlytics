import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_signal_flutter/session_manager.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<LoadDataEvent>((event, emit) async{
      await Future.delayed(const Duration(seconds: 2));
      final isFirstOpenApp = await SessionManager.share.getIsFirstOpenApp();
      if(isFirstOpenApp){
        emit(GoToLoginScreen());
      }else{
        emit(GoToDashboardScreen());
      }

    });
  }
}
