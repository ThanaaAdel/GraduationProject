import 'package:flutter/material.dart';
import 'package:graduationproject/screens/login_register_profile_pages/Log_in_information_user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashScreenFunction() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return   const Login();
      },
    ));
  }

  @override
  void initState() {
    super.initState();
    splashScreenFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.asset('assets/images/splash.jpg',width: double.infinity , fit: BoxFit.cover),
    );
  }
}