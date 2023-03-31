import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_signal_flutter/play_music_detail/bloc/play_music_detail_bloc.dart';
import 'dart:math' as math;
import 'package:one_signal_flutter/utils/image_const.dart';

class PlayMusicDetailDashboardScreen extends StatelessWidget {
  const PlayMusicDetailDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayMusicDetailBloc(),
      child: PlayMusicDetailDashboardForm(),
    );
  }
}

class PlayMusicDetailDashboardForm extends StatefulWidget {
  const PlayMusicDetailDashboardForm({Key? key}) : super(key: key);

  @override
  State<PlayMusicDetailDashboardForm> createState() =>
      _PlayMusicDetailDashboardScreenFormState();
}

class _PlayMusicDetailDashboardScreenFormState
    extends State<PlayMusicDetailDashboardForm>
    with TickerProviderStateMixin {
  double sliderValue = 0;
  late AnimationController animationController;
  bool stopPlayMusic = true;
  late String startEndTime;
  late String remainTime;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 10000),
        upperBound: math.pi * 2);
    if (!stopPlayMusic) {
      startAnimation();
    }
  }

  void startAnimation() {
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        if (animationController.status == AnimationStatus.completed) {
          animationController.repeat();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF4B4A4A),
                        Color(0xFF2A2A2A),
                      ],
                      stops: [
                        0.0,
                        1.0
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated),
                )),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          IMAGE_CONST.img_down_arrow.path,
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Text(
                        'Title',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFE7E7E7)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert_outlined,
                          size: 25,
                          color: Color(0xFFE7E7E7),
                        ),
                      )
                    ],
                  )),
            ),
            Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: BlocBuilder<PlayMusicDetailBloc, PlayMusicDetailState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        AnimatedBuilder(
                          animation: animationController,
                          child: Container(
                            height: 320,
                            width: 320,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle),
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                child: Image.asset(
                                  IMAGE_CONST.img_test.path,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          builder: (context, widget) {
                            return Transform.rotate(
                              angle: animationController.value,
                              child: widget,
                            );
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 35, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 30,
                                child: InkWell(
                                  onTap: () {},
                                  child: const Icon(Icons.share,
                                      size: 25, color: Color(0xFFE7E7E7)),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Center(
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    crossAxisAlignment: WrapCrossAlignment
                                        .center,
                                    spacing: 8,
                                    children: const [
                                      Center(
                                        child: Text(
                                          'Shut down',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'BLACKPINK',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.favorite_outline,
                                    color: Color(0xFFE7E7E7),
                                    size: 25,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Slider(
                                value: sliderValue,
                                activeColor: Colors.yellow,
                                inactiveColor: Colors.grey,
                                onChanged: (value) {
                                  print('Slider value: ${value.toInt()}');
                                  setState(() {
                                    sliderValue = value;
                                  });
                                })),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '0:00',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFFE7E7E7)),
                              ),
                              Text(
                                '4:00',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFFE7E7E7)),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.shuffle,
                          size: 25,
                          color: Color(0xFFE7E7E7),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.skip_previous,
                          size: 50,
                          color: Color(0xFFE7E7E7),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            stopPlayMusic = !stopPlayMusic;
                            if (stopPlayMusic) {
                              animationController.stop();
                            } else {
                              startAnimation();
                            }
                          });
                        },
                        child: Icon(
                          stopPlayMusic
                              ? Icons.play_circle_outline_rounded
                              : Icons.pause_circle_outline,
                          size: 80,
                          color: const Color(0xFFE7E7E7),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.skip_next,
                          size: 50,
                          color: Color(0xFFE7E7E7),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.shuffle,
                          size: 25,
                          color: Color(0xFFE7E7E7),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlayMusicHeader extends StatefulWidget {
  const PlayMusicHeader({Key? key}) : super(key: key);

  @override
  State<PlayMusicHeader> createState() => _PlayMusicHeaderState();
}

class _PlayMusicHeaderState extends State<PlayMusicHeader> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PlayMusicController extends StatefulWidget {
  const PlayMusicController({Key? key}) : super(key: key);

  @override
  State<PlayMusicController> createState() => _PlayMusicControllerState();
}

class _PlayMusicControllerState extends State<PlayMusicController> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
