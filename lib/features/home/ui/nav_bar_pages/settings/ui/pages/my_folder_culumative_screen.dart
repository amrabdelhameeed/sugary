import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_padings.dart';
import 'package:sugar/core/database_provider/cumulative_db_provider.dart';
import 'package:sugar/core/models/cumulative_model.dart';

class MyFolderCumulativeScreen extends StatelessWidget {
  const MyFolderCumulativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showAddDialog(context);
          },
          label: Text('Add Entry')),
      appBar: AppBar(
        title: Text('Cumulative Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: CumulativeDBprovider.listenable(),
              builder: (context, value, child) {
                final list = value.values.toList();
                return ListView.separated(
                  padding: AppPadding.mainPadding,
                  shrinkWrap: true,
                  itemCount: list.length + 1,
                  separatorBuilder: (context, index) {
                    return Divider();
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
                              child: Text(
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
                              child: Text(
                                "Read",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox())
                        ],
                      );
                    }
                    return GestureDetector(
                      onLongPress: () {
                        CumulativeDBprovider.delete(list[index - 1].key);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(DateFormat("yyyy-MM-dd").format(list[index - 1].dateTime!), textAlign: TextAlign.center),
                          ),
                          Expanded(
                            child: Text(list[index - 1].read!.toString(), textAlign: TextAlign.center),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: IconButton(
                                        onPressed: () {
                                          _showEditDialog(context, list[index - 1]);
                                        },
                                        icon: Icon(Icons.edit))),
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        CumulativeDBprovider.delete(list[index - 1].key);
                                      },
                                      icon: Icon(Icons.delete)),
                                )
                              ],
                            ),
                          )
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

  Future<void> _selectDate(BuildContext context, TextEditingController controller, Function(DateTime) onDateSelected) async {
    DateTime initialDate = DateTime.now();
    if (controller.text.isNotEmpty) {
      try {
        initialDate = DateFormat("yyyy-MM-dd").parse(controller.text);
      } catch (e) {
        print("Error parsing date: $e");
      }
    }
    final DateTime? picked = await showDatePicker(context: context, initialDate: initialDate, firstDate: DateTime(2000), lastDate: DateTime(2100));
    if (picked != null && picked != initialDate) {
      controller.text = DateFormat("yyyy-MM-dd").format(picked);
      onDateSelected(picked);
    }
  }

  void _showAddDialog(BuildContext context) {
    CumulativeModel newEntry = CumulativeModel(DateTime.now(), null);
    TextEditingController dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Cumulative Entry'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // TextButton(
                //   onPressed: () => _selectDate(context, dateController, (selectedDate) {
                //     newEntry.dateTime = selectedDate;
                //   }),
                //   child: Text(dateController.text.isEmpty ? "Select Date" : dateController.text),
                // ),
                TextField(
                  onChanged: (value) => newEntry.read = num.tryParse(value),
                  decoration: InputDecoration(hintText: "Enter Reading"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add'),
              onPressed: () {
                CumulativeDBprovider.add(newEntry).then((_) => Navigator.of(context).pop());
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, CumulativeModel item) {
    TextEditingController dateController = TextEditingController(text: DateFormat("yyyy-MM-dd").format(item.dateTime!));
    TextEditingController readController = TextEditingController(text: item.read.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Cumulative Entry'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: dateController,
                  onChanged: (value) => item.dateTime = DateFormat("yyyy-MM-dd").parse(value),
                  decoration: InputDecoration(hintText: "Enter Date (YYYY-MM-DD)"),
                ),
                TextField(
                  controller: readController,
                  onChanged: (value) => item.read = num.tryParse(value),
                  decoration: InputDecoration(hintText: "Enter Reading"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Update'),
              onPressed: () {
                item.save(); // Assuming your CumulativeModel extends HiveObject
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
