import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_signal_flutter/home/bloc/home_bloc.dart';
import 'package:one_signal_flutter/home/item_music.dart';
import 'package:one_signal_flutter/utils/color_const.dart';
import 'package:one_signal_flutter/utils/image_const.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeScreenForm(),
    );
  }
}

class HomeScreenForm extends StatefulWidget {
  const HomeScreenForm({Key? key}) : super(key: key);

  @override
  State<HomeScreenForm> createState() => _HomeScreenFormState();
}

class _HomeScreenFormState extends State<HomeScreenForm> {
  final PageController _pageController = PageController();
  static const platform = MethodChannel('getSongChannel');
  final String _batteryLevel = 'Unknown battery level';
  Future<void> _getBatteryLevel() async{
    String battery;
    try{
      final result = await platform.invokeListMethod('getBattery');
      battery = 'Battery result: $result';
    }on PlatformException catch(e){
      battery = 'Get failed: ${e.message}';
    }

  }
  int currentPage = 0;
  List<String> images = [
    IMAGE_CONST.img_test.path,
    IMAGE_CONST.img_jisoo.path,
    IMAGE_CONST.img_jennie.path,
    IMAGE_CONST.img_rose.path,
    IMAGE_CONST.img_lisa.path,
  ];

  @override
  void initState() {
    super.initState();
    // _getSongs();
  }

  Future<void> createFolderInAppDocDir() async {

  }
  Future<void> _getSongs() async {

  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('------> $_batteryLevel');
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 95, left: 10),
              height: 180,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemCount: 5,
                itemBuilder: (context, position) {
                  var imagePath = images[position];
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover
                      )
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
              child: Center(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, position) {
                      return _indicator(position == currentPage);
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Danh sách bài hát',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: COLOR_CONST.blueLightMain),
                      ),
                      InkWell(
                        child: const Icon(
                          Icons.navigate_next,
                          size: 26,
                          color: COLOR_CONST.blueLightMain,
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 30,
                          itemBuilder: (context, position) {
                            return const MusicItemForm();
                          }))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _indicator(bool isSelected) {
  return Center(
    child: SizedBox(
      height: 40,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isSelected ? 10 : 8.0,
        width: isSelected ? 12 : 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.amber : const Color(0XFFEAEAEA),
        ),
      ),
    ),
  );
}
