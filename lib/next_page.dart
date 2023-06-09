import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:password_boggler/save_page.dart';

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
          title: Text('Choose Number', style: GoogleFonts.shrikhand()),
          content: Column(
            children: [
              Text('Select a number between 1 and 5:',
                  style: GoogleFonts.shrikhand()),
              SizedBox(
                height: 16,
              ),
              DropdownButton<int>(
                value: selectedNumber,
                items: [
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('1', style: GoogleFonts.shrikhand()),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text('2', style: GoogleFonts.shrikhand()),
                  ),
                  DropdownMenuItem<int>(
                    value: 3,
                    child: Text('3', style: GoogleFonts.shrikhand()),
                  ),
                  DropdownMenuItem<int>(
                    value: 4,
                    child: Text('4', style: GoogleFonts.shrikhand()),
                  ),
                  DropdownMenuItem<int>(
                    value: 5,
                    child: Text('5', style: GoogleFonts.shrikhand()),
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
              child: Text('OK', style: GoogleFonts.shrikhand()),
              onPressed: () {
                Navigator.of(context).pop();
                if (selectedNumber != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Confirmation',
                          style: GoogleFonts.shrikhand(),
                        ),
                        content: Column(
                          children: [
                            Text(
                              'You have selected $selectedNumber rotors.',
                              style: GoogleFonts.shrikhand(),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Please enter $selectedNumber random numbers:',
                              style: GoogleFonts.shrikhand(),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextField(
                              controller: secretPasswordController,
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              maxLength: selectedNumber,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(selectedNumber),
                              ],
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: OutlineInputBorder(),
                                hintText: 'Enter random numbers',
                                labelText: 'Random Numbers',
                              ),
                              style: GoogleFonts.shrikhand(),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'OK',
                              style: GoogleFonts.shrikhand(),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  var daycontroller = TextEditingController();
  var domainNameController = TextEditingController();
  var secretPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 15,
                child: Image(
                  image: AssetImage('assets/Password-Boggler1.png'),
                ),
              ),
              Expanded(
                flex: 25,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Select Number of Rotors 1-5:',
                        style: GoogleFonts.shrikhand(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        selectedNumber != null ? selectedNumber.toString() : '-',
                        style:
                        TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                        child: Text(
                          'Click to Select',
                          style: GoogleFonts.shrikhand(),
                        ),
                        onPressed: () {
                          _showNumberPickerDialog();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 16),
                      width: 400,
                      child: TextField(
                        controller: secretPasswordController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                          hintText: 'Secret Password Generated!',
                          labelText: 'Secret Password Generated!',
                        ),
                        style: GoogleFonts.shrikhand(),
                      ),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Copy',
                        style: GoogleFonts.shrikhand(),
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                          text: secretPasswordController.text,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Password Copied!'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 25,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 16),
                      width: 400,
                      child: TextField(
                        controller: domainNameController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                          hintText: 'Write Domain Name to Save',
                          labelText: 'Write Domain Name to Save',
                        ),
                        style: GoogleFonts.shrikhand(),
                      ),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Save',
                        style: GoogleFonts.shrikhand(),
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                          text: domainNameController.text,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Successfully Saved!'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 30),
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.black)
                            )
                        ),
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.orangeAccent)
                    ),
                    onPressed: () {
                      print(domainNameController.text);
                      print(secretPasswordController.text);

                      var timestamp = new DateTime.now().millisecondsSinceEpoch;

                      FirebaseDatabase.instance.reference().child("domains/dom" + timestamp.toString()).set(
                      {
                        "name" : domainNameController.text,
                        "password" : secretPasswordController.text,
                      }
                      ).then((value) {
                        print("Sucessfully created the chore");
                      }).catchError((error) {
                        print("Failed to create" + error.toString());
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => savePage()),
                        );
                    },
                    child: Text('View your Savings',
                      style: GoogleFonts.shrikhand(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}









