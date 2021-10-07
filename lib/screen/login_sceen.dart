import 'package:bingo_chat/utils/utils.dart';
import 'package:bingo_chat/widgets/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(left: 37.0, right: 37, top: 25.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              
              TextFormField(
                controller: _emailController,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
                decoration: getInputTextStyle('Email', 12, Colors.black),
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                validator: (value) {
                  return !Validators.isValidEmail(value)
                      ? 'Email must be in the form example@gmail.com'
                      : null;
                },
                // onChanged: (_) {
                //   setState(() {
                //     colorTextMail = sunYellow;
                //   });
                // },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
                // onChanged: (_) {
                //   setState(() {
                //     colorTextpassword = sunYellow;
                //   });
                // },
                // decoration:
                //     getInputTextStyle("Password", 12 * blockSizeWidth),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    labelText: 'Password',
                    labelStyle: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorStyle: TextStyle(fontSize: 12)),
                obscureText: _passwordVisible,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                validator: (value) {
                  return !Validators.isValidPassword(value)
                      ? 'The password must contain at least 6 characters'
                      : null;
                },
              ),
              SizedBox(
                height: 26,
              ),
              CustomButtom(
                text: 'Login',
                borderColor: Colors.black,
                colorText: Colors.white,
                materialColor: Colors.black,
                fontSize: 20,
                onPressMethod: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((value) {
                    print(
                        "value >>>> ${value.user.uid}  / ${value.user.email}");
                  }).onError((error, stackTrace) {
                    print("error >>>> $error");
                  });
                },
                height: 48,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 26,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
