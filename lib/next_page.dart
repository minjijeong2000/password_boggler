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
          title: Text('Choose Number',style: GoogleFonts.shrikhand()),
          content: Column(
            children: [
              Text('Select a number between 1 and 5:',style: GoogleFonts.shrikhand()),
              SizedBox(height: 16),
              DropdownButton<int>(
                value: selectedNumber,
                items: [
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('1',style: GoogleFonts.shrikhand()),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text('2',style: GoogleFonts.shrikhand()),
                  ),
                  DropdownMenuItem<int>(
                    value: 3,
                    child: Text('3',style: GoogleFonts.shrikhand()),
                  ),
                  DropdownMenuItem<int>(
                    value: 4,
                    child: Text('4',style: GoogleFonts.shrikhand()),
                  ),
                  DropdownMenuItem<int>(
                    value: 5,
                    child: Text('5',style: GoogleFonts.shrikhand()),
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
              child: Text('OK',style: GoogleFonts.shrikhand()),
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
              'Select Number of Rotors 1-5:',
              style: GoogleFonts.shrikhand(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              selectedNumber != null ? selectedNumber.toString() : '-',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('Click to Select', style: GoogleFonts.shrikhand(),),
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








