import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_signal_flutter/utils/color_const.dart';
import 'package:one_signal_flutter/utils/image_const.dart';

class MusicItem extends StatelessWidget {
  const MusicItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MusicItem();
  }
}

class MusicItemForm extends StatefulWidget {
  const MusicItemForm({Key? key}) : super(key: key);

  @override
  State<MusicItemForm> createState() => _MusicItemFormState();
}

class _MusicItemFormState extends State<MusicItemForm> {
  Image img = Image.asset('assets/logo.png');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.amber,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Image.asset(IMAGE_CONST.img_test.path, fit: BoxFit.fill,),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Music\'s name name ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: COLOR_CONST.blueLightMain,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Music\'s name',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: COLOR_CONST.blueLightMain, fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                child: Icon(
                  Icons.favorite_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
                onTap: () {},
              ),
              InkWell(
                child: Icon(
                  Icons.more_vert_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
