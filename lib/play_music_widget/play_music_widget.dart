import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_signal_flutter/play_music_widget/bloc/play_music_widget_bloc.dart';
import 'package:one_signal_flutter/utils/color_const.dart';

import '../utils/image_const.dart';

class PlayMusicWidget extends StatelessWidget {
  const PlayMusicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PlayMusicWidgetBloc(), child: const PlayMusicWidget(),);
  }
}

class PlayMusicWidgetForm extends StatefulWidget {
  const PlayMusicWidgetForm({Key? key}) : super(key: key);

  @override
  State<PlayMusicWidgetForm> createState() => _PlayMusicWidgetFormState();
}

class _PlayMusicWidgetFormState extends State<PlayMusicWidgetForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: COLOR_CONST.blueLightMain,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(20), // Image radius
                child: Image.asset(IMAGE_CONST.img_test.path, fit: BoxFit.cover,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

