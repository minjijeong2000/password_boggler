import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';


class nextPage extends StatefulWidget {
  const nextPage({Key? key}) : super(key: key);

  @override
  State<nextPage> createState() => _nextPageState();


}

class _nextPageState extends State<nextPage> {

  int? selectedNumber;

  void _showNumberPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Number'),
          content: Column(
            children: [
              Text('Select a number between 1 and 5:'),
              SizedBox(height: 16),
              DropdownButton<int>(
                value: selectedNumber,
                items: [
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('1'),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text('2'),
                  ),
                  DropdownMenuItem<int>(
                    value: 3,
                    child: Text('3'),
                  ),
                  DropdownMenuItem<int>(
                    value: 4,
                    child: Text('4'),
                  ),
                  DropdownMenuItem<int>(
                    value: 5,
                    child: Text('5'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedNumber = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  var daycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Number:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              selectedNumber != null ? selectedNumber.toString() : '-',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('Choose Number'),
              onPressed: () {
                _showNumberPickerDialog();
              },
            ),
          ],
        ),
      ),
    );
  }
}








