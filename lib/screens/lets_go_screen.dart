import 'package:flutter/material.dart';

class LetsGoScreen extends StatelessWidget {
  static const routeName = 'lets-go-screen';
  const LetsGoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF2FEFF),
      appBar: AppBar(
        backgroundColor: const Color(0XFFF2FEFF),
        centerTitle: true,
        title: Image.asset('assets/images/app_logo.png'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(
            width: double.infinity,
            'assets/images/intro_screen.png',
            fit: BoxFit.cover,
          ),
          const Text('Personalize Your Experience'),
          const Text(
              'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.'),
        ],
      ),
    );
  }
}
