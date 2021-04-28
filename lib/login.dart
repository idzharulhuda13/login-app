import 'package:flutter/material.dart';
import 'package:flutter_base/component/roudedinput.dart';
import 'package:flutter_base/component/roundedinputpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future<void> _submit () async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailcontroller.text,
            password: _passwordcontroller.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    return Column(
      children: [
        Text('Welcome !'),
        SizedBox(height: 10,),
        RoundedInput('Email', _emailcontroller),
        SizedBox(height: 10,),
        RoundedInputPassword(_passwordcontroller),
        ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.only(left: 50, right: 50)
            ),
          ),
          onPressed: _submit,
          child: Text('Login'),
        ),
        Text(
          'Forgot Pssword',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
