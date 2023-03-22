import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_signal_flutter/app_router.dart';
import 'package:one_signal_flutter/login/login_screen.dart';
import 'package:one_signal_flutter/splash/bloc/splash_bloc.dart';
import 'package:one_signal_flutter/utils/image_const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SplashBloc(), child: SplashScreenForm(),);
  }
}


class SplashScreenForm extends StatefulWidget {
  const SplashScreenForm({Key? key}) : super(key: key);

  @override
  State<SplashScreenForm> createState() => _SplashScreenFormState();
}

class _SplashScreenFormState extends State<SplashScreenForm> {

  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(LoadDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) async{
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        // if(state is GoToLoginScreen){
          Navigator.pushNamedAndRemoveUntil(context, AppRouter.LOGIN_SCREEN, (route) => false);
        // }else if(state is GoToDashboardScreen){
        // Navigator.pushNamedAndRemoveUntil(context, AppRouter.DASHBOARD_SCREEN, (route) => false);
        // }
      },
      child: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF0D1925),
                    Color(0xFF2A6193),
                    Colors.yellowAccent,
                  ],
                )
            ),
            child: Center(child: Image.asset(IMAGE_CONST.img_logo_128.path,),)
        ),
      ),
    );
  }
}

