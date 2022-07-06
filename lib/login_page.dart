// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_firebase/dimension.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // text controller
    final _emailController = TextEditingController(text: '');
    final _passwordController = TextEditingController(text: '');

    Future signIn() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }

    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    Widget header() {
      return Container(
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 95,
            ),
            SizedBox(height: Dimensions.height35),
            Text(
              'Welcome Back !',
              style: GoogleFonts.workSans(
                fontSize: Dimensions.fontSize24,
                fontWeight: FontWeight.w800,
                color: Color(0xff092C4C),
              ),
            ),
            SizedBox(height: Dimensions.height14),
            Text(
              'Sign in to your continue\naccount',
              style: GoogleFonts.workSans(
                fontSize: Dimensions.fontSize18,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'Email',
            fillColor: Colors.grey[200],
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: 'Password',
            fillColor: Colors.grey[200],
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );
    }

    Widget button() {
      return Column(
        children: [
          GestureDetector(
            onTap: signIn,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Sign In',
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account ?',
                style: GoogleFonts.workSans(
                  fontSize: 13,
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('Tapped Sign Up');
                },
                child: Text(
                  ' Sign up',
                  style: GoogleFonts.workSans(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
            width: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  header(),
                  inputEmail(),
                  inputPassword(),
                  button(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
