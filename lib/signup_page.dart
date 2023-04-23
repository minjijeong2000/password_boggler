import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              Expanded(
                  flex: 10,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Text(
                          'Password-Boggler',
                          style: GoogleFonts.shrikhand(fontSize: 30, fontWeight: FontWeight.bold),
                          // TextStyle(
                          //   fontSize: 15,
                          //   fontWeight: FontWeight.bold
                          // ),
                        ),
                      )
                    ],
                  )
              ),
              const Expanded(
                flex: 20,
                child: Image(
                  // image: AssetImage('assets/home.jpg'),
                  image: AssetImage('assets/Password-Boggler1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  flex: 60,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top:20, bottom: 20),
                          child: Text(
                            'Signup',
                            style: GoogleFonts.shrikhand(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                          child: TextFormField(
                            controller: nameController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                            ),
                            style: GoogleFonts.shrikhand(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                          child: TextFormField(
                            controller: emailController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                            style: GoogleFonts.shrikhand(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                            style: GoogleFonts.shrikhand(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password.';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                            ),
                            style: GoogleFonts.shrikhand(),
                            validator: (value) {
                              if (value != passwordController.text) {
                                return 'Password does not match';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 10),
                          width: 100,
                          height: 30,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.black),
                                ),
                              ),
                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.orangeAccent),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print(emailController.text);
                                print(passwordController.text);
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                    .then((value) {
                                  print("Successfully signed up!");
                                  Navigator.pop(context);
                                }).catchError((error) {
                                  print("Failed to sign up!");
                                  print(error.toString());
                                });
                              }
                            },
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.shrikhand(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
