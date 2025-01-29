import 'package:todo/screens/create_event/create_event.dart';
import 'package:todo/screens/edit_event/edit_event.dart';
import 'package:todo/screens/home/home.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/screens/onboarding/onboarding.dart';
import 'package:todo/screens/register/register.dart';
import 'package:todo/screens/test.dart';


class AppRoutesNames {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String test = '/test';
  static const String register = '/register';
  static const String home = '/home';
  static const String createEvent = '/create_event';
  static const String editEvent = '/edit_event';
}

var routes = {
  AppRoutesNames.onboarding: (context) => const Onboarding(),
  AppRoutesNames.login: (context) =>  Login(),
  AppRoutesNames.test: (context) => const Test(),
  AppRoutesNames.register: (context) =>  Register(),
  AppRoutesNames.home: (context) =>   const Home(),
  AppRoutesNames.createEvent: (context) =>    CreateEvent(),
 //AppRoutesNames.editEvent: (context) =>    EditEvent( ),
};
