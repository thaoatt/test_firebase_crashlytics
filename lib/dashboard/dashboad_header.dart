import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_signal_flutter/dashboard/bloc/dashboard_bloc.dart';
import 'package:one_signal_flutter/utils/color_const.dart';
import 'package:one_signal_flutter/utils/image_const.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: const DashboardHeaderForm(),
    );
  }
}

class DashboardHeaderForm extends StatefulWidget {
  const DashboardHeaderForm({Key? key}) : super(key: key);

  @override
  State<DashboardHeaderForm> createState() => _DashboardHeaderFormState();
}

class _DashboardHeaderFormState extends State<DashboardHeaderForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 10),
      child: Stack(
        children: [
          Positioned(
            left: 0,top: 0,
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20), // Image radius
                  child: Image.asset(IMAGE_CONST.img_test.path, fit: BoxFit.cover,),
                ),
              ),
            ),
          ),
          Positioned(
            left: 50,
            right: 40,
            child: Container(
             height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xFFEEEEEE)),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search ...',
                    suffixIcon: Icon(
                      Icons.mic,
                      color: COLOR_CONST.blueLightMain,
                    ),
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          Positioned(
            right:0, top: 0,
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20), // Image radius
                  child: const Icon(
                    Icons.settings,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
