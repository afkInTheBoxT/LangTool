import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation; // Option 2

class DeadlinePicker extends StatefulWidget {
  
  const DeadlinePicker({Key key}) : super(key: key);

  @override
  _DeadlinePickerState createState() => _DeadlinePickerState();
}

class _DeadlinePickerState extends State<DeadlinePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        DropdownButton(
            hint: Text('Please choose a location'), // Not necessary for Option 1
            value: _selectedLocation,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            },
            items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
        ),
        Container(
          child: SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
          ),
        ),
      ],
    ));
  }
}
