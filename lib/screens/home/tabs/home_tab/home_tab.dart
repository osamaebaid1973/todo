import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/app_resources/app_colors.dart';
import 'package:todo/firebase/firebase_helper.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/home/tabs/home_tab/event_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<TaskModel>>(
      stream: FirebaseHelper.getEvents(),
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Welcome Back ✨',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.lightThemeBackgroundColor,
                                  fontSize: 14)),
                          const Spacer(),
                          Image.asset('assets/images/Sun.png',
                              color: AppColors.lightThemeBackgroundColor),
                          const SizedBox(width: 8),
                          Image.asset('assets/images/language.png'),
                        ],
                      ),
                      Text('John Safwat',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppColors.lightThemeBackgroundColor,
                                fontSize: 24,
                              )),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Map_Pin.png',
                            //color: AppColors.lightThemeBackgroundColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Cairo , Egypt',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.lightThemeBackgroundColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  )),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  color: AppColors.lightThemeTextFieldEnabledColor,
                  child: const SizedBox(
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: snapshot.data?.docs.length ?? 0,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 24);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return  EventItem(taskModel: snapshot.data!.docs[index].data());
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
