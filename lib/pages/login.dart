// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_heaven/pages/home.dart';
import 'package:sweet_heaven/pages/signup.dart';

class log extends StatefulWidget {
  const log({Key? key}) : super(key: key);

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  bool changebutton = false;
  bool isHiddenPassword = true;
  final _formkey = GlobalKey<FormState>();
  home(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, "/home");
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF86BE7B),
      body: Container(
        height: size.height,
        width: size.width,
        child: Card(
          elevation: 4.0,
          margin: EdgeInsets.all(30),
          color: Color(0xFFC0E6BA),
          child: Stack(
            children: [
              Center(
                child: Form(
                  key: _formkey,
                  child: Container(
                    width: 400,
                    height: 590,
                    child: Column(
                      children: [
                        Text("Welcome",
                            style: GoogleFonts.festive(
                                color: Color(0xFF013237),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2)),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 40.0),
                          child: Column(
                            children: [
                              TextFormField(
                                cursorColor: Color(0xFF4CA771),
                                style: GoogleFonts.festive(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color(0xFF4CA771),
                                  ),
                                  hintText: "Enter username",
                                  labelText: "Username",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF4CA771)),
                                  ),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  floatingLabelStyle:
                                      const TextStyle(color: Color(0xFF4CA771)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Username cannot be empty!";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                cursorColor: Color(0xFF4CA771),
                                style: GoogleFonts.festive(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                                keyboardType: TextInputType.text,
                                obscureText: isHiddenPassword,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xFF4CA771),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: _viewPassword,
                                    child: Icon(Icons.visibility,
                                        color: Color(0xFF4CA771)),
                                  ),
                                  hintText: "Enter password",
                                  labelText: "Password",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF4CA771),
                                    ),
                                  ),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  floatingLabelStyle:
                                      const TextStyle(color: Color(0xFF4CA771)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password cannot be empty!";
                                  } else if (value.length < 8) {
                                    return "Password cannot be less than 8 characters!";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFF4CA771),
                                child: InkWell(
                                  onTap: () => home(context),
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Login",
                                      style: GoogleFonts.festive(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account ?",
                                    style: GoogleFonts.festive(
                                      color: Color(0xFF013237),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Signup()));
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: GoogleFonts.festive(
                                          color: Color(0xFF4AC771),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/fruit1.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _viewPassword() {
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = true;
    }
    setState(() {});
  }
}
