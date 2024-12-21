import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/lets_go_screen.dart';
import 'package:todo/theme/light_theme.dart';
import 'package:todo/theme/theme.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = LightTheme();
    return MaterialApp(
      initialRoute: LetsGoScreen.routeName,
      routes: {LetsGoScreen.routeName: (context) => const LetsGoScreen()},
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: theme.themeData,
      home: Container(),
    );
  }
}
