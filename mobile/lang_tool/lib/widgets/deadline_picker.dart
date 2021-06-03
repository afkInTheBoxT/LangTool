import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/test.dart';
import 'package:lang_tool/models/user.dart';
import 'package:lang_tool/pages/account_page.dart';
import 'package:lang_tool/pages/test_page.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
String _selectedLocation = null; // Option 2

String testNameDeadLine = "";
String startDate = "";
String endDate = "";
bool fin = false;

class DeadlinePicker extends StatefulWidget {
  DeadlinePicker({Key key, this.curUser}) : super(key: key);
  User curUser;
  @override
  _DeadlinePickerState createState() => _DeadlinePickerState();
}

// int state = 0;

class _DeadlinePickerState extends State<DeadlinePicker> {
  String _selectedLocation = null;
  List<Test> tests;
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';

  String _rangeCount = '';
  int state = 0;
  @override
  Widget build(BuildContext context) {
    while (state < 2) {
      getTests();
      state++;
      print(tests);
      testNameDeadLine = "";
      startDate = "";
      endDate = "";
    }
    return Scaffold(
        body: tests == null
            ? Text("Зачекайте")
            : Column(
                children: [
                  DropdownButton(
                    hint: Text('Обріть тему'), // Not necessary for Option 1
                    value: _selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue.toString();
                      });
                      testNameDeadLine = newValue.toString();
                    },
                    items: tests.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location.testName.toString()),
                        value: location.testName.toString(),
                      );
                    }).toList(),
                  ),
                  Container(
                    child: SfDateRangePicker(
                      selectionMode: DateRangePickerSelectionMode.range,
                      onSelectionChanged: _onSelectionChanged,
                    ),
                  ),
                  testNameDeadLine == ""
                      ? Text("Вы не выбрали тест!")
                      : Text(""),
                ],
              ));
  }

  getTests() async {
    await APIServices.fetchTests().then((response) {
      Iterable list = json.decode(response.body);
      List<Test> studentList = List<Test>();
      studentList = list.map((model) => Test.fromObject(model)).toList();
      if (this.mounted) {
        setState(() {
          tests = studentList;
        });
      }
    });
  }

  _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      startDate =
          DateFormat('dd.MM.yyyy').format(args.value.startDate).toString();
      endDate = DateFormat('dd.MM.yyyy')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    } else if (args.value is DateTime) {
      _selectedDate = args.value.toString();
    } else if (args.value is List<DateTime>) {
      _dateCount = args.value.length.toString();
    } else {
      _rangeCount = args.value.length.toString();
    }
  }
}
