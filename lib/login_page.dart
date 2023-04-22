import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_boggler/next_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            flex: 40,
            child: Image(
              image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.vf2LPcJu-SM_2l2deT_swgHaIE%26pid%3DApi&f=1&ipt=920e4c9614d0f32d09f770fccc881eb50abceb361b7ddd09abfbb8454cc6f40e&ipo=images'),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 50,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top:20, bottom: 20),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                  child: const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                  child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.red
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 30),
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)
                              )
                          )
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => nextPage()),
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: const Text('App Logo'),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.book)
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.computer),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}