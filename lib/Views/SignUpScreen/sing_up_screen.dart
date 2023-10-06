import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_app/Views/utils/app_images.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.twitter,size: 70,color: Colors.blue,),
            Text(
              'SignUp To Twitter',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 30, 15, 0),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey.shade200,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return " Please Enter Your Email";
                  } else if (!emailValid.hasMatch(value)) {
                    return "Email Does Not Match";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey.shade200,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "Please Enter Your Password";
                  } else if (value.length < 6) {
                    return "Please Enter your Password";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  return null;
                } else {
                  return null;
                }
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Already have an account? Log in',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
