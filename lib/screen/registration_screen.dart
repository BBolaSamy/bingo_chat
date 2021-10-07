import 'package:bingo_chat/utils/utils.dart';
import 'package:bingo_chat/widgets/components.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final format = intl.DateFormat("yyyy-MM-dd");
  // ignore: unused_field
  DateTime _birthDate;
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(left: 37.0, right: 37, top: 25.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              TextFormField(
                controller: _firstNameController,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
                decoration: getInputTextStyle('First Name', 12, Colors.black),
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty) {
                    return ('name empty');
                  } else if (value.length < 3) {
                    return ('short name');
                  } else if (value.length > 20) {
                    return ('long name');
                  }
                  return null;
                },
                // onChanged: (_) {
                //   setState(() {
                //     colorTextMail = sunYellow;
                //   });
                // },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _lastNameController,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
                decoration: getInputTextStyle('last Name', 12, Colors.black),
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty) {
                    return ('name empty');
                  } else if (value.length < 3) {
                    return ('short name');
                  } else if (value.length > 20) {
                    return ('long name');
                  }
                  return null;
                },
                // onChanged: (_) {
                //   setState(() {
                //     colorTextMail = sunYellow;
                //   });
                // },
              ),
              SizedBox(height: 20),
              DateTimeField(
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  format: format,
                  validator: (value) {
                    if (value == null) {
                      return ('Birth Date empty');
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _birthDate = value;
                    // setState(() {
                    //   colorTextBarthdate = sunYellow;
                    // });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ??
                          DateTime(DateTime.now().year - 20,
                              DateTime.now().month, DateTime.now().day - 1),
                      lastDate: DateTime(DateTime.now().year - 20,
                          DateTime.now().month, DateTime.now().day - 1),
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.dark().copyWith(
                            colorScheme: ColorScheme.dark(
                              primary: Colors.grey,
                              onPrimary: Colors.white,
                              surface: Colors.white,
                              onSurface: Colors.black,
                            ),
                            dialogBackgroundColor: Colors.white,
                          ),
                          child: child,
                        );
                      },
                    );
                  },
                  decoration:
                      getInputTextStyle("Birth Date", 12, Colors.black)),
              SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
                decoration: getInputTextStyle('Phone', 12, Colors.black),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty) {
                    return ('phone empty');
                  } else if (value.length < 11) {
                    return ('short Phone');
                  } else if (value.length > 11) {
                    return ('long phone');
                  } else {
                    return null;
                  }
                },
                // onChanged: (_) {
                //   setState(() {
                //     colorTextMail = sunYellow;
                //   });
                // },
              ),
              SizedBox(height: 20),
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
                text: 'Registration',
                borderColor: Colors.black,
                colorText: Colors.white,
                materialColor: Colors.black,
                fontSize: 20,
                onPressMethod: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
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
