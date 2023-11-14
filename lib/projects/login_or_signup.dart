import 'package:flutter/material.dart';
import 'package:taskproject/projects/login_page.dart';
import 'package:taskproject/projects/signup.dart';

class login_or_signup extends StatefulWidget {

  login_or_signup({Key? key}) : super(key: key);

  @override
  State<login_or_signup> createState() => _login_or_signupState();
}

class _login_or_signupState extends State<login_or_signup> {
  bool isLogin=true;

  void togglePage(){
    setState(() {
      isLogin=!isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(isLogin){
      return LoginPage(
        onPressed: togglePage,
      );
    }else{
      return SignUppage(
        onPressed: togglePage,
      );
    }
  }
}
