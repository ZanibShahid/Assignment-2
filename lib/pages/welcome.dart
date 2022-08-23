// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_heaven/pages/signup.dart';
import 'package:sweet_heaven/pages/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(children: [
        Scaffold(
            backgroundColor: Color(0xFFC0E6BA),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Align(
                    alignment: Alignment
                        .topCenter, // Align however you like (i.e .centerRight, centerLeft)
                    child: Text(
                      "Welcome to Sweet Heaven",
                      style: GoogleFonts.festive(
                        color: Color(0xFF013237),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/images/welcome0.png",
                  height: 190,
                  width: 300,
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => log()));
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF4AC771),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.festive(
                            color: Color(0xFF013237),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF4AC771),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Center(
                        child: Text(
                          "Signup",
                          style: GoogleFonts.festive(
                            color: Color(0xFF013237),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Image.asset(
              "assets/images/fruit1.png",
            ))
      ]),
    );
  }
}
