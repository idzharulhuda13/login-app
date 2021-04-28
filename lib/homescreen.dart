import 'package:flutter/material.dart';
import 'package:flutter_base/login.dart';
import 'package:flutter_base/signup.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/logo.png'),
              Login(),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Text('Or'),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Social Media Login',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Image.asset(
                              'assets/logogoogle.png'
                          ),
                          onPressed: (){}
                      ),
                      IconButton(
                          icon: Image.asset(
                              'assets/logofacebook.png'
                          ),
                          onPressed: (){}
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        child: Text(
                          'Don\'t have account? Signup',
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(),
                              ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
