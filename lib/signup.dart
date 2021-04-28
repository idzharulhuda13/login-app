import 'package:flutter/material.dart';
import 'package:flutter_base/component/roudedinput.dart';
import 'package:flutter_base/component/roundedinputpassword.dart';
import 'package:flutter_base/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatelessWidget {

  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future<void> _submit () async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailcontroller.text,
            password: _passwordcontroller.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Create an Account',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
            ),
          ),
          Column(
            children: [
              RoundedInput('name', _namecontroller),
              SizedBox(height: 10,),
              RoundedInput('Email', _emailcontroller),
              SizedBox(height: 10,),
              RoundedInputPassword(_passwordcontroller),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.only(left: 50, right: 50)
                  ),
                ),
                onPressed: _submit,
                child: Text('Signup'),
              ),
            ],
          ),
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
                'Social Media Signup',
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
                      'Already have an account? Login',
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
