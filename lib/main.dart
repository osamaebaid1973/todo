import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_resources/app_routes_names.dart';
import 'package:todo/app_resources/app_themes/app_themes.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:easy_localization/easy_localization.dart';

//import 'package:todo/theme/light_theme.dart';
//import 'package:todo/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          path:
              'assets/translations', // <-- change the path of the translation files
          fallbackLocale: const Locale('en'),
          child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: AppRoutesNames.onboarding,
      routes: routes,
      debugShowCheckedModeBanner: false,
      //builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
      //locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: provider.themeMode,
    );
  }
}
