import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/projects/signup.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onPressed;

  const LoginPage({super.key,required this.onPressed});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading=false;
  final _formKey=GlobalKey<FormState>();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _pass=TextEditingController();

  signInWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading=true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _pass.text,
      );
      setState(() {
        isLoading=false;
      });
      print("Sign-in successful");
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading=false;
      });
      print("Error during sign-in: ${e.toString()}");
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user found for that email.')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
      }
    }


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: OverflowBar(
              overflowSpacing: 20,
              children: [
                TextFormField(
                  controller: _email,
                  validator: (text){
                    if(text==null || text.isEmpty){
                      return "email is empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Enter Email"),
                ),
                TextFormField(
                  obscureText: true,
                  controller: _pass,
                  validator: (text){
                    if(text==null || text.isEmpty){
                      return "Password is empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Enter Password"),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        signInWithEmailAndPassword();
                        print("done");
                      }

                    }, child:isLoading?Center(child: CircularProgressIndicator(
                    color: Colors.white,
                  )): Text("Login"),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an acc? ',style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: (){
                          widget.onPressed?.call();
                        }
                        , child: Text('Signup')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
