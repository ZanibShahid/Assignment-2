// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_heaven/pages/login.dart';
import 'package:email_validator/email_validator.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // ignore: prefer_final_fields
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  bool changebutton = false;
  bool isHiddenPassword = true;
  bool isHiddenConfrimPassword = true;
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
        child: SingleChildScrollView(
          child: Card(
            elevation: 4.0,
            margin: EdgeInsets.all(20),
            color: Color(0xFFC0E6BA),
            child: Stack(
              children: [
                Center(
                  child: Form(
                    key: _formkey,
                    child: Container(
                      width: 400,
                      height: 700,
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: GoogleFonts.festive(
                                color: Color(0xFF013237),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                          Center(
                            child: Column(
                              children: [
                                TextFormField(
                                  cursorColor: Color(0xFF4CA771),
                                  style: GoogleFonts.festive(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color(0xFF4CA771),
                                    ),
                                    hintText: "Enter your name",
                                    labelText: "Full Name",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF4CA771)),
                                    ),
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xFF4CA771)),
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Name cannot be empty!";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  cursorColor: Color(0xFF4CA771),
                                  style: GoogleFonts.festive(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color(0xFF4CA771),
                                    ),
                                    hintText: "Enter email",
                                    labelText: "Email",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF4CA771)),
                                    ),
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xFF4CA771)),
                                  ),
                                  validator: (value) =>
                                      EmailValidator.validate(value!)
                                          ? null
                                          : "Email not Valid",
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                    cursorColor: Color(0xFF4CA771),
                                    style: GoogleFonts.festive(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Color(0xFF4CA771),
                                      ),
                                      hintText: "Enter Phone number",
                                      labelText: "Phone number",
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF4CA771)),
                                      ),
                                      labelStyle:
                                          const TextStyle(color: Colors.grey),
                                      floatingLabelStyle: const TextStyle(
                                          color: Color(0xFF4CA771)),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Number cannot be empty!";
                                      } else if (value.length < 11) {
                                        return "Number cannot be less than 11 numbers!";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 10.0,
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
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xFF4CA771)),
                                  ),
                                  controller: _password,
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
                                  height: 10.0,
                                ),
                                TextFormField(
                                  cursorColor: Color(0xFF4CA771),
                                  style: GoogleFonts.festive(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                  keyboardType: TextInputType.text,
                                  obscureText: isHiddenConfrimPassword,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Color(0xFF4CA771),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: _confrimPassword,
                                      child: Icon(Icons.visibility,
                                          color: Color(0xFF4CA771)),
                                    ),
                                    hintText: "Enter password again",
                                    labelText: "Confirm Password",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF4CA771),
                                      ),
                                    ),
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xFF4CA771)),
                                  ),
                                  controller: _confirm,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password cannot be empty!";
                                    } else if (value.length < 8) {
                                      return "Password cannot be less than 8 characters!";
                                    } else if (value != _password.text) {
                                      return "Password Incorrect!";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFF4CA771),
                                  child: InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => log()))
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 200,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Sign Up",
                                        style: GoogleFonts.festive(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account ?",
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
                                                  builder: (context) => log()));
                                        },
                                        child: Text(
                                          "Login",
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

  void _confrimPassword() {
    if (isHiddenConfrimPassword == true) {
      isHiddenConfrimPassword = false;
    } else {
      isHiddenConfrimPassword = true;
    }
    setState(() {});
  }
}
