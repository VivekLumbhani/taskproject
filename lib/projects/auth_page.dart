import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/projects/home.dart';
import 'package:taskproject/projects/login_or_signup.dart';
import 'package:taskproject/projects/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context,AsyncSnapshot<User?> snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }else{
              if(snapshot.hasData){
                return Homepage();
              }else{
                return login_or_signup();
              }
            }
          },
      ),
    );
  }
}
