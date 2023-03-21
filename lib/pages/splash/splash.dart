import 'package:flutter/material.dart';
import 'package:note_crud/pages/home/home.dart';

class Splash extends StatefulWidget {
  static const String route = "/splash";

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _goHome();
  }

  _goHome() async {
    await Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Home.route,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPLASH'),
      ),
    );
  }
}
