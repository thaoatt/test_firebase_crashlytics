import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_signal_flutter/home/bloc/home_bloc.dart';
import 'package:one_signal_flutter/home/item_music.dart';
import 'package:one_signal_flutter/utils/color_const.dart';

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
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _getSongs();
  }

  Future<void> _getSongs() async{
    Directory dir = Directory('/storage/emulated/0/');
    String mp3Path = dir.toString();
    print('MP3 path: $mp3Path');
    List<FileSystemEntity> _files;
    List<FileSystemEntity> _songs = [];
    _files = dir.listSync(recursive: true, followLinks: false);
    for(FileSystemEntity entity in _files) {
      String path = entity.path;
      if(path.endsWith('.mp3'))
        _songs.add(entity);
    }
    print('List song: $_songs');
    print(_songs.length);
  }

  @override
  Widget build(BuildContext context) {
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
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.orange),
                    child: Text('Position ${position + 1}'),
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
                          itemCount: 10,
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
