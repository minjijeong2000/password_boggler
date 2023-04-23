import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class savePage extends StatefulWidget {
  const savePage({Key? key}) : super(key: key);

  @override
  State<savePage> createState() => _savePageState();
}

class _savePageState extends State<savePage> {
  var domainList = [];

  _savePageState() {
    FirebaseDatabase.instance.reference().child("domains").once()
        .then((databaseEvent) {
      print("Successfully loaded the data");
      DataSnapshot dataSnapshot = databaseEvent.snapshot;
      print(dataSnapshot);
      print("Key:");
      print(dataSnapshot.key);
      print("Value:");
      print(dataSnapshot.value);
      var domainTempList = [];
      if (dataSnapshot.value != null) {
        Map<dynamic, dynamic> values = dataSnapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          print(key);
          print(value);
          domainTempList.add(value);

        });
        print("Final Domain List:");
        print(domainTempList);
        domainList = domainTempList;
        setState(() {

        });
      }
    }).catchError((error) {
      print("Failed to load the data");
      print(error);
    });
  }


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
                    child: Text('Saved Lists',
                      style: GoogleFonts.shrikhand(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Container(child: Image(
                    image: AssetImage('assets/Password-Boggler1.png'),
                  ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: ListView.builder(
                itemCount: domainList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Container(
                      height: 50,
                      margin: EdgeInsets.only(
                          top: 5, bottom: 5, left: 20, right: 20),
                      child: Row(
                        children: [
                          Flexible(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text('${domainList[index]['name']}',
                                      style: GoogleFonts.shrikhand(fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)
                                  ),
                                  margin: EdgeInsets.only(right: 20),
                                ),

                                Container(
                                  child: Text('${domainList[index]['password']}',
                                      style: GoogleFonts.shrikhand(
                                          fontSize: 12, color: Colors.black)
                                  ),
                                  margin: EdgeInsets.only(right: 20),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

