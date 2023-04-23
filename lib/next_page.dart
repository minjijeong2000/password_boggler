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

  int _currentIntValue = 1;
  int _currentHorizontalIntValue = 1;

  var daycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        Row(
        children: [
        Expanded(
          flex: 70,
          child: Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20, left: 80),
            child: Text('Generate Password',
              style: GoogleFonts.caveat(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 15,
          child: Container(child: Image(
            image: AssetImage('assets/homelogo.png'),
          ),
          ),
        ),
        ],
      ),
      ]
    ),

    )
    );
  }
}
