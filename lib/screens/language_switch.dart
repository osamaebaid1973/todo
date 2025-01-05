import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/app_resources/app_colors.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: AppColors.primaryColor)),
              child: InkWell(
                onTap: () {
                  context.setLocale(const Locale('en'));
                },
                child: Image.asset(
                  'assets/images/LR.png',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.setLocale(const Locale('ar'));
              },
              child: Image.asset(
                'assets/images/EG.png',
              ),
            )
          ],
        ));
  }
}
