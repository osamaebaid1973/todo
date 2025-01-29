import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_resources/app_colors.dart';
import 'package:todo/providers/my_provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Container(
        height: 30,
        width: 73,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          //color: AppColors.primaryColor,
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: AppColors.primaryColor)),
              child: InkWell(
                onTap: () {
                  provider.setLightTheme();
                },
                child: Image.asset(
                  'assets/images/Sun.png',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                provider.setDarkTheme();
              },
              child: Image.asset(
                'assets/images/Moon.png',
              ),
            )
          ],
        ));
  }
}
