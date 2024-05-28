import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sugar/core/database_provider/mdeication_db_provider.dart';
import 'package:sugar/core/models/day_enum.dart';
import 'package:sugar/core/models/medication_model.dart';
import 'package:sugar/core/utils/fcm_helper.dart';
import 'package:sugar/core/widgets/default_text_form_field.dart';

class MedecationReminderScreen extends StatefulWidget {
  const MedecationReminderScreen({Key? key}) : super(key: key);

  @override
  _MedecationReminderScreenState createState() => _MedecationReminderScreenState();
}

class _MedecationReminderScreenState extends State<MedecationReminderScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
  }

  // Future<void> _showNotification() async {
  //   await _scheduleCustomNotifications();
  // }

  // Future<void> _scheduleCustomNotifications() async {
  //   for (int i = 0; i < _selectedDays.length; i++) {
  //     if (_selectedDays[i]) {
  //       // Calculate the date for the selected day
  //       DateTime scheduledDate = DateTime.now().add(Duration(days: i + 1));
  //       // Combine the scheduled date with the selected time
  //       DateTime scheduledDateTime = DateTime(
  //         scheduledDate.year,
  //         scheduledDate.month,
  //         scheduledDate.day,
  //         _selectedTime!.hour,
  //         _selectedTime!.minute,
  //       );
  //       await NotificationHelper.scheduleNotificationAtSpecificTime(id, scheduledDateTime, "title", "body", payload: DateTime.now().toIso8601String());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            TimeOfDay? _selectedTime;
            final List<bool> _selectedDays = List.generate(7, (_) => false); // 7 days of the week

            Widget _buildDaySelection(setState) {
              return Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(7, (index) {
                  return FilterChip(
                    label: Text(_getDayName(index)),
                    selected: _selectedDays[index],
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedDays[index] = selected;
                      });
                    },
                  );
                }),
              );
            }

            Future<void> _showTimePicker(BuildContext context, setState) async {
              final pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null && pickedTime != _selectedTime) {
                setState(() {
                  _selectedTime = pickedTime;
                });
              }
            }

            DateTime getNextOccurrence(int weekdayIndex) {
              DateTime now = DateTime.now();
              int daysToAdd = (weekdayIndex - now.weekday + 7) % 7;
              if (daysToAdd == 0) daysToAdd = 7; // Ensure it's scheduled for the next week
              return DateTime(now.year, now.month, now.day + daysToAdd, _selectedTime!.hour, _selectedTime!.minute);
            }

            final controller = TextEditingController();

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    content: StatefulBuilder(
                      builder: (context, setState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefaultTextFormField(
                              hint: "Medicine name",
                              controller: controller,
                            ),
                            _buildDaySelection(setState),
                            _selectedTime == null
                                ? ElevatedButton(
                                    onPressed: () {
                                      _showTimePicker(context, setState);
                                    },
                                    child: const Text("Select time"))
                                : Text(_selectedTime!.format(context))
                          ],
                        );
                      },
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            int id = Random().nextInt(50000);
                            MedicationDBprovider.add(
                                id, MedicationModel(controller.text, convertSelectedDaysToList(_selectedDays).map((e) => e.name).toList(), "${_selectedTime!.hour}:${_selectedTime!.minute}"));

                            for (int i = 0; i < _selectedDays.length; i++) {
                              if (_selectedDays[i]) {
                                DateTime nextOccurrence = getNextOccurrence(i);
                                NotificationHelper.scheduleNotificationAtSpecificTime(id, nextOccurrence, "It's time for ${controller.text}", "Please take your medication now");
                              }
                            }
                            Navigator.pop(context);
                          },
                          child: const Text('Add')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel')),
                    ]);
              },
            );
          },
          label: const Text('Add reminder')),
      appBar: AppBar(
        title: const Text('Medication Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder(
          valueListenable: MedicationDBprovider.listenable(),
          builder: (context, value, child) {
            final list = value.values.toList();
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(list[index].name.toString()),
                  subtitle: Text(list[index].weekDays!.join(',').toString()),
                  leading: CircleAvatar(
                    radius: 25,
                    child: Text(
                      DateFormat('hh:mm a').format(DateFormat('HH:mm').parse(list[index].timeOfDay!)),
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        NotificationHelper.deleteNotification(list[index].key);
                        MedicationDBprovider.delete(list[index].key);
                      },
                      icon: Icon(Icons.delete)),
                );
              },
            );
          },
        ),
      ),
    );
  }

  DayEnum _getDayEnumFromIndex(int index) {
    switch (index) {
      case 0:
        return DayEnum.Monday;
      case 1:
        return DayEnum.Tuesday;
      case 2:
        return DayEnum.Wednesday;
      case 3:
        return DayEnum.Thursday;
      case 4:
        return DayEnum.Friday;
      case 5:
        return DayEnum.Saturday;
      case 6:
        return DayEnum.Sunday;
      default:
        throw Exception("Invalid day index");
    }
  }

  List<DayEnum> convertSelectedDaysToList(List<bool> selectedDays) {
    List<DayEnum> days = [];
    for (int i = 0; i < selectedDays.length; i++) {
      if (selectedDays[i]) {
        days.add(_getDayEnumFromIndex(i));
      }
    }
    return days;
  }

  String _getDayName(int index) {
    switch (index) {
      case 0:
        return 'Mon';
      case 1:
        return 'Tue';
      case 2:
        return 'Wed';
      case 3:
        return 'Thu';
      case 4:
        return 'Fri';
      case 5:
        return 'Sat';
      case 6:
        return 'Sun';
      default:
        return '';
    }
  }
}
