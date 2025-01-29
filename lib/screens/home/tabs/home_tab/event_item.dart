import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/app_resources/app_colors.dart';
import 'package:todo/app_resources/app_routes_names.dart';
import 'package:todo/firebase/firebase_helper.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/edit_event/edit_event.dart';

class EventItem extends StatelessWidget {
  TaskModel taskModel;
  EventItem({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(taskModel.date);
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset('assets/images/${taskModel.category}.png'),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Row(
                  children: [
                    Text(taskModel.category,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    const Spacer(),
                    const Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseHelper.deleteEvent(taskModel.id);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => EditEvent(data: taskModel,)));
                            
                      },
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 16, top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Text(
                  DateFormat('d').format(dateTime),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(DateFormat('MMM').format(dateTime),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor))
              ],
            ))
      ],
    );
  }
}
