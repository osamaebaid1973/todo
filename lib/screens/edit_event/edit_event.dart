import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_resources/app_colors.dart';
import 'package:todo/firebase/firebase_helper.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/providers/create_event_provider.dart';

class EditEvent extends StatefulWidget {
   TaskModel data;

  EditEvent({required this.data,super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.data.title!;
    descriptionController.text = widget.data.description!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     
   
   
    return ChangeNotifierProvider(
        create: (context) => CreateEventProvider(),
        builder: (context, child) {
          var provider = Provider.of<CreateEventProvider>(context);
          
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.primaryColor),
              title: Text(
                'Update Event',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 24, fontWeight: FontWeight.w100),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                            'assets/images/${provider.eventCategories[provider.selectedCategoryIndex]}.png')),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.eventCategories.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 16);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: provider.selectedCategoryIndex == index
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(37),
                                  border: Border.all(
                                      width: 2, color: AppColors.primaryColor)),
                              child: GestureDetector(
                                onTap: () {
                                  provider.selectCategory(index);
                                },
                                child: Text(
                                  provider.eventCategories[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color:
                                              provider.selectedCategoryIndex ==
                                                      index
                                                  ? Colors.white
                                                  : AppColors.primaryColor),
                                ),
                              ));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Title',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        label: Row(
                          children: [
                            Image.asset(
                              'assets/images/Note_Edit.png',
                              color: AppColors.lightThemeTextFieldEnabledColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Event Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: AppColors
                                          .lightThemeTextFieldEnabledColor,
                                      fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Description',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                        controller: descriptionController,
                        minLines: 5,
                        maxLines: 10,
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            label: Row(children: [
                              Image.asset(
                                'assets/images/Note_Edit.png',
                                color:
                                    AppColors.lightThemeTextFieldEnabledColor,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text('Event Description'),
                            ]))),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset('assets/images/Calendar_Days.png'),
                        const SizedBox(width: 8),
                        Text(
                          'Event Date',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            var chosenDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 365)),
                                initialDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)));
                            widget.data.date = chosenDate!.millisecondsSinceEpoch;
                            setState(() {
                              
                            });
                            
                            
                          },
                          child: Text(
                            DateTime.fromMillisecondsSinceEpoch(widget.data.date).toString().substring(0,10),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.data.title = titleController.text;
                          widget.data.description = descriptionController.text;
                          widget.data.category = provider.eventCategories[provider.selectedCategoryIndex];
                           FirebaseHelper.updateEvent(widget.data);
                          Navigator.pop(context);
                        },
                        child:  Text(
                          "Update Event",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

