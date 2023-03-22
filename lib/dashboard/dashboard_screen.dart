import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_signal_flutter/account/account_screen.dart';
import 'package:one_signal_flutter/dashboard/bloc/dashboard_bloc.dart';
import 'package:one_signal_flutter/dashboard/dashboad_header.dart';
import 'package:one_signal_flutter/home/home_screen.dart';
import 'package:one_signal_flutter/library/library_screen.dart';
import 'package:one_signal_flutter/play_music_widget/bloc/play_music_widget_bloc.dart';
import 'package:one_signal_flutter/utils/color_const.dart';

import '../play_music_widget/play_music_widget.dart';
import '../utils/image_const.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => DashboardBloc()),
      BlocProvider(create: (_) => PlayMusicWidgetBloc())
    ], child: const DashboardScreenForm());
  }
}

class DashboardScreenForm extends StatefulWidget {
  const DashboardScreenForm({Key? key}) : super(key: key);

  @override
  State<DashboardScreenForm> createState() => _DashboardScreenFormState();
}

class _DashboardScreenFormState extends State<DashboardScreenForm> {
  int _currentPage = 0;
  bool isClickPlayButton = false;

  List<Widget> dashboardScreens = [
    const HomeScreen(),
    const LibraryScreen(),
    const AccountScreen()
  ];

  void setCurrentPage(int currentPage) {
    setState(() {
      _currentPage = currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          dashboardScreens[_currentPage],
          const DashboardHeader(),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                color: COLOR_CONST.blueLightMain,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 4,
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle),
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(20), // Image radius
                              child: Image.asset(
                                IMAGE_CONST.img_test.path,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 4,
                        right: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Music\'s name name name name name',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Music\'s name',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: -15,
                        top: 10,
                        child: Container(
                          width: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.skip_previous_sharp,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isClickPlayButton = !isClickPlayButton;
                                  });
                                },
                                child: Icon(
                                    isClickPlayButton?Icons.play_arrow:Icons.pause,
                                    color: Colors.white,
                                    size: 30
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.skip_next,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {
                  setCurrentPage(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.my_library_music,
                      color: _currentPage == 0
                          ? COLOR_CONST.blueLightMain
                          : Colors.grey,
                      size: 30,
                    ),
                    Visibility(
                      visible: _currentPage == 0,
                      child: const Text(
                        'Trang chủ',
                        style: TextStyle(
                            color: COLOR_CONST.blueLightMain, fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setCurrentPage(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.my_library_add,
                      color: _currentPage == 1
                          ? COLOR_CONST.blueLightMain
                          : Colors.grey,
                      size: 30,
                    ),
                    Visibility(
                      visible: _currentPage == 1,
                      child: const Text(
                        'Thư viện',
                        style: TextStyle(
                            color: COLOR_CONST.blueLightMain, fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setCurrentPage(2);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.switch_account,
                      size: 30,
                      color: _currentPage == 2
                          ? COLOR_CONST.blueLightMain
                          : Colors.grey,
                    ),
                    Visibility(
                      visible: _currentPage == 2,
                      child: const Text(
                        'Tài khoản',
                        style: TextStyle(
                            color: COLOR_CONST.blueLightMain, fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
