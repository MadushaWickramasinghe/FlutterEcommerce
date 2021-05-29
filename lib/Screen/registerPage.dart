import 'package:ecommerce/Screen/loginPage.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/widget/customInput.dart';
import 'package:ecommerce/widget/custom_btn.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Container(
                    padding: EdgeInsets.only(top: 80.0),
                    child: Text("Welcome,\n Please SignIn",textAlign: TextAlign.center,style: Constants.boldheading,)
                ),//welcome signin
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:<Widget> [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text("Email or Username",style: Constants.textfield,),
                        )),
                    CustomInput(),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text("Password",style: Constants.textfield,),
                        )),
                    CustomInput(),
                    CustomBtn(
                      btntext: "Login",
                      outlineBtn: true,
                      onPressed:(){
                        print("Clicked");
                      },
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    
                   Navigator.pop(context);

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text("You Don't have Account Yet ?",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
