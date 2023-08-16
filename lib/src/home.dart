// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/home.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: DropdownDatePickerExample(),
          ),
        ),
      ),
    );
  }
}

class DropdownDatePickerExample extends StatefulWidget {
  const DropdownDatePickerExample({super.key});

  @override
  State<DropdownDatePickerExample> createState() =>
      _DropdownDatePickerExampleState();
}

class _DropdownDatePickerExampleState extends State<DropdownDatePickerExample> {
  String dropdownValue1 = 'Select State';
  DateTime? selectedDate;
  String dropdownValue3 = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 110,
            child: DropdownButton<String>(
              value: dropdownValue1,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue1 = newValue!;
                  if (dropdownValue1 == 'Mumbai') {
                    dropdownValue3 = 'Select Temperature';
                  } else {
                    dropdownValue3 = '';
                  }
                });
              },
              items: <String>[
                'Select State',
                'Delhi',
               'Mumbai',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          if (selectedDate != null)
            Text(
              'Selected Date: ${selectedDate!.toIso8601String().split('T')[0]}',
              style: const TextStyle(fontSize: 16),
            ),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: const Text('Select Date'),
          ),
          const SizedBox(height: 16),
          if (dropdownValue3.isNotEmpty)
            SizedBox(
              width: 170,
              child: DropdownButton<String>(
                value: dropdownValue3,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue3 = newValue!;
                  });
                },
                items: <String>[
                  'Select Temperature',
                  '23 Celcius',
                  '25 Celcius',
                  '27 Celcius',
                  '29 Celcius',
                  '32 Celcius',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          const SizedBox(height: 16),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                // Perform submit action with the selected values and date
                print('Selected values:');
                print('Dropdown 1: $dropdownValue1');
                if (selectedDate != null) {
                  print('Selected date: ${selectedDate!.toIso8601String().split('T')[0]}');
                }
                print('Dropdown 3: $dropdownValue3');
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
