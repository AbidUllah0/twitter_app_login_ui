import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_app/Views/utils/app_images.dart';

import '../SignUpScreen/sing_up_screen.dart';

class LoginScreen extends StatelessWidget {
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
            FaIcon(
              FontAwesomeIcons.twitter,
              size: 70,
              color: Colors.blue,
            ),
            Text(
              'Login To Twitter',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 30, 15, 0),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
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
                    return "Email Must Not Empty";
                  }
                  //for email pattern
                  else if (!emailValid.hasMatch(value)) {
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
                obscureText: true,
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
                    return " Password Must Not Empty";
                  } else if (value.length < 6) {
                    return " Password Length Must be 6";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  return null;
                } else {
                  return null;
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Lon In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
              child: Text(
                "Don't have an Account? Sign up here",
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
