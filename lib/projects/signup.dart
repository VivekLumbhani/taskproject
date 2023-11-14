import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/projects/home.dart';
import 'package:taskproject/projects/login_page.dart';

class SignUppage extends StatefulWidget {
  final Function()? onPressed;
  const SignUppage({super.key,required this.onPressed});

  @override
  State<SignUppage> createState() => Signup();
}

class Signup extends State<SignUppage> {
  bool isLoading=false;
  final _formKey=GlobalKey<FormState>();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _pass=TextEditingController();

  createUserWithEmailAndPassword() async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _pass.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The password provided is too weak.')),
        );

      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The account already exists for that email.')),
        );
      }
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignUp"), centerTitle: true,),
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
                        createUserWithEmailAndPassword();

                        print("done");
                      }

                    }, child:isLoading?Center(child: CircularProgressIndicator(
                    color: Colors.white,
                  )): Text("SignUp"),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an acc? ',style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: (){
                          widget.onPressed?.call();
                        }
                        , child: Text('Login')),
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
