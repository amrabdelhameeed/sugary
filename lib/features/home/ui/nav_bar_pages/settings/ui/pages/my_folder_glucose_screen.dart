import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_padings.dart';
import 'package:sugar/core/database_provider/cumulative_db_provider.dart';
import 'package:sugar/core/database_provider/glucose_db_provider.dart';
import 'package:sugar/core/models/glucose_model.dart';

class MyFolderGlucoseScreen extends StatelessWidget {
  const MyFolderGlucoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showAddDialog(context);
          },
          label: const Text('Add Entry')),
      appBar: AppBar(
        title: const Text('Glucose Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: GlucoseDBprovider.listenable(),
              builder: (context, value, child) {
                final list = value.values.toList();
                return ListView.separated(
                  padding: AppPadding.mainPadding,
                  shrinkWrap: true,
                  itemCount: list.length + 1,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.appColor),
                              child: const Text(
                                "Day",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.appColor),
                              child: const Text(
                                "Read",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.appColor),
                              child: const Text(
                                "Insulin",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox())
                        ],
                      );
                    }
                    return GestureDetector(
                      onLongPress: () {
                        GlucoseDBprovider.delete(list[index - 1].key);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(DateFormat("yyyy-MM-dd").format(list[index - 1].dateTime!), textAlign: TextAlign.center),
                          ),
                          Expanded(
                            child: Text(
                              list[index - 1].read!.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(list[index - 1].insulin!.toString(), textAlign: TextAlign.center),
                          ),
                          Expanded(
                              child: Row(
                            children: [
                              Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        _showEditDialog(context, list[index - 1], index);
                                      },
                                      icon: const Icon(Icons.edit))),
                              Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      GlucoseDBprovider.delete(list[index - 1].key);
                                    },
                                    icon: const Icon(Icons.delete)),
                              )
                            ],
                          ))
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    GlucoseModel newGlucose = GlucoseModel(DateTime.now(), null, null);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add New Glucose Reading'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    // TextButton(
                    //   onPressed: () => _selectDate(context, dateController, (selectedDate) {
                    //     newGlucose.dateTime = selectedDate;
                    //     setState(() {});
                    //   }),
                    //   child: Text(dateController.text.isEmpty ? "Select Date" : dateController.text),
                    // ),
                    TextField(
                      onChanged: (value) => newGlucose.read = num.tryParse(value),
                      decoration: const InputDecoration(hintText: "Enter Glucose Read"),
                    ),
                    TextField(
                      onChanged: (value) => newGlucose.insulin = num.tryParse(value),
                      decoration: const InputDecoration(hintText: "Enter Insulin Dose"),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    GlucoseDBprovider.add(newGlucose).then((_) => Navigator.of(context).pop());
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Future<void> _selectDate(BuildContext context, TextEditingController controller, Function(DateTime) onDateSelected) async {
  //   DateTime initialDate = DateTime.now();
  //   if (controller.text.isNotEmpty) {
  //     try {
  //       initialDate = DateFormat("yyyy-MM-dd").parse(controller.text);
  //     } catch (e) {
  //       print("Error parsing date: $e");
  //     }
  //   }
  //   final DateTime? picked = await showDatePicker(context: context, initialDate: initialDate, firstDate: DateTime(2000), lastDate: DateTime(2100));
  //   if (picked != null && picked != initialDate) {
  //     controller.text = DateFormat("yyyy-MM-dd").format(picked);
  //     onDateSelected(picked);
  //   }
  // }

//
  void _showEditDialog(BuildContext context, GlucoseModel item, int index) {
    TextEditingController dateController = TextEditingController(text: DateFormat("yyyy-MM-dd").format(item.dateTime!));
    TextEditingController readController = TextEditingController(text: item.read.toString());
    TextEditingController insulinController = TextEditingController(text: item.insulin.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Glucose Reading'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // TextField(
                //   controller: dateController,
                //   onChanged: (value) => item.dateTime = DateFormat("yyyy-MM-dd").parse(value),
                //   decoration: InputDecoration(hintText: "Enter Date (YYYY-MM-DD)"),
                // ),
                TextField(
                  controller: readController,
                  onChanged: (value) => item.read = num.tryParse(value),
                  decoration: const InputDecoration(hintText: "Enter Glucose Read"),
                ),
                TextField(
                  controller: insulinController,
                  onChanged: (value) => item.insulin = num.tryParse(value),
                  decoration: const InputDecoration(hintText: "Enter Insulin Dose"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                item.save(); // Assuming your GlucoseModel extends HiveObject
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
