import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/app_resources/app_images_path.dart';
//import 'package:todo/screens/custom_toggle.dart';
import 'package:todo/screens/onboarding/language_switch.dart';
import 'package:todo/screens/onboarding/theme_switch.dart';
import 'package:todo/app_resources/app_routes_names.dart';

class Onboarding extends StatelessWidget {
  static const routeName = 'lets-go-screen';
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImagesPath.onboardingAppBarTitleImage),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              width: double.infinity,
              'assets/images/intro_screen.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 28,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              'introduction_title'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'introduction_body'.tr(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              children: <Widget>[
                Text(
                  'language'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                const LanguageSwitch()
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'theme'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                const ThemeSwitch(),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRoutesNames.login);
                },
                child: Text(
                  "letsStart".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
