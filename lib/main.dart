import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:password_boggler/next_page.dart';
import 'package:password_boggler/signup_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.red,
      // ),
      home: MyHomePage(title: 'Password-Boggler'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const MySecondPage()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
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
                          style: GoogleFonts.caveat(fontSize: 30, fontWeight: FontWeight.bold),
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
                flex: 30,
                child: Image(
                  // image: AssetImage('assets/home.jpg'),
                  image: AssetImage('https://pixy.org/images/placeholder.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 50,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top:20, bottom: 20),
                      child: Text(
                        'Login',
                        style: GoogleFonts.caveat(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                      child: TextField(
                        controller: emailController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        style: GoogleFonts.caveat(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        style: GoogleFonts.caveat(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child:
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.caveat(color: Colors.red),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 10),
                        width: 100,
                        height: 20,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black)
                                  )
                              ),
                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.white)
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupPage()),
                            );
                          },
                          child:
                          Text(
                            'Sign up',
                            style: GoogleFonts.caveat(color: Colors.black),
                          ),
                        )
                    ),
                    Expanded(
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
                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepOrangeAccent)
                          ),
                          onPressed: () {
                            FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                                .then((value){
                              print("Login successfully!");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => nextPage()),
                              );
                            }).catchError((error) {
                              print("Failed to login!");
                              print(error.toString());
                            });
                          },
                          child: Text('Login',
                            style: GoogleFonts.caveat(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
