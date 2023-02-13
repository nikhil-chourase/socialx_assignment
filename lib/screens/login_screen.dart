import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialx/screens/news_screen.dart';
import 'package:socialx/screens/sign_up_screen.dart';
import 'package:socialx/widgets/big_text.dart';


class LoginScreen extends StatefulWidget {

  static String id = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade400,
        child: Column(
          children: [
            Container(
              height: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
                color: Colors.red.shade800,
              ),


              child: Column(
                children: [
                  Container(
                    height: 85,
                    padding: EdgeInsets.only(left: 30,top: 20),
                    child: Row(

                      children: [
                        BigText(
                          text: 'Social',
                          color: Colors.grey.shade300,
                          size: 30,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(width: 5,),
                        BigText(text: 'X', size: 40, color: Colors.white,fontWeight: FontWeight.w400,),
                      ],
                    ),


                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),),
                    ),

                    child: Row(
                      children: [
                        Container(
                          width: 205,
                          decoration: BoxDecoration(
                            color: Colors.red.shade800,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
                          ),

                          child: Center(
                            child: BigText(text: 'LOGIN',size: 16,color: Colors.grey,fontWeight: FontWeight.w500,),
                          ),
                        ),
                        Container(
                          width: 205,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),),
                            color: Colors.white,
                          ),

                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SignUpScreen.id);

                            },
                            child: Center(
                              child: BigText(text: 'SIGN UP',size: 16,color: Colors.grey,fontWeight: FontWeight.w500,),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 465,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(left: 45,right: 45,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'SignIn into your \n Account', size: 30, color: Colors.red, fontWeight: FontWeight.w600),
                    SizedBox(height: 20,),
                    BigText(text: 'Email', size: 17, color: Colors.black, fontWeight: FontWeight.w600),
                    TextField(

                      onChanged: (value) {
                        email = value;
                        //Do something with the user input.
                      },

                      decoration: InputDecoration(
                        hintText: '',
                        suffixIcon: Icon(Icons.mail,color: Colors.red,),
                      ),
                    ),
                    SizedBox(height: 20,),
                    BigText(text: 'Password', size: 17, color: Colors.black, fontWeight: FontWeight.w600),
                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                        //Do something with the user input.
                      },


                      decoration: InputDecoration(
                        hintText: '',
                        suffixIcon: Icon(Icons.lock,color: Colors.red,),

                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.only(left: 180),
                      child: BigText(text: 'Forgot Password ?', size: 16, color: Colors.red, fontWeight: FontWeight.w800),
                    ),

                    SizedBox(height: 15,),
                    Container(
                      padding: EdgeInsets.only(left: 120),
                      child: BigText(text: 'Login with', size: 15, color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(

                          onPressed: () {


                          },
                          child: Container(
                            child: Image.asset('images/google.png'),

                            height: 27.0,
                          ),
                        ),
                        MaterialButton(

                            onPressed: () {

                            },
                            child: Icon(Icons.facebook,color: Colors.blue,),),
                      ],
                    ),

                    //SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(text: 'Don\'t  have an account ?', size: 15, color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                        MaterialButton(

                            onPressed: () {
                              Navigator.pushNamed(context, SignUpScreen.id);
                            },
                            child: BigText(text: 'Register now', size: 15, color: Colors.red, fontWeight: FontWeight.w800)),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 63,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30),),
                color: Colors.red.shade800,
              ),
              child: MaterialButton(
                onPressed: () async{
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    if(user != null){
                      Navigator.pushNamed(context, NewsScreen.id);
                    }
                  }catch(e){
                    print(e);
                  }
                },
                child: Center(
                  child: BigText(
                    text: 'LOG IN',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
