import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_resources/app_routes_names.dart';
import 'package:todo/app_resources/app_themes/app_themes.dart';
import 'package:todo/providers/auth_provider.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//import 'package:todo/theme/light_theme.dart';
//import 'package:todo/theme/theme.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
await FirebaseFirestore.instance.enableNetwork();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<MyProvider>(create: (context) => MyProvider(),),
     ChangeNotifierProvider(create: (context) => AuthProvider(),),
    ],
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        child:  MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    MyProvider provider = Provider.of<MyProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute:authProvider.currentUser == null ? AppRoutesNames.onboarding : AppRoutesNames.home,//: AppRoutesNames.home,
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
