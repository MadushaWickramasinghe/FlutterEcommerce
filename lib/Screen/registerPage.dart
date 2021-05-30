import 'package:ecommerce/Screen/loginPage.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/widget/customInput.dart';
import 'package:ecommerce/widget/custom_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  Future<void> _alertDialog( String error) async{
    return showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("Close"),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
        );
  }

  //create new acc

  Future<String> _createNewAccount() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:_registerEmail,
          password: _registerPassword,
      );
      return null;
    } on FirebaseAuthException catch (e){
      if(e.code == 'Weak Password'){
        return 'Password is weak';
      }else if (e.code == 'email already in use'){
        return 'account already use';
      }
      return e.message;

    }catch(e){
     return e.toString();

    }
  }

  void _submitForm() async{

    setState(() {
      _registerFormLoading = true;
    });

    String _createAccountFeedback = await  _createNewAccount();

    if(_createAccountFeedback != null){
      _alertDialog(_createAccountFeedback);

      setState(() {
        _registerFormLoading = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

  bool _registerFormLoading = false;

  String _registerEmail = "";
  String _registerPassword = "";

  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
  _passwordFocusNode.dispose();
    super.dispose();
  }


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
                    child: Text("Create A New Acoount",textAlign: TextAlign.center,style: Constants.boldheading,)
                ),//welcome signin
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text("Email or Username",style: Constants.textfield,),
                        ),
                    ),
                    CustomInput(
                      onChanged:(value){
                        _registerEmail = value;
                      },
                      onSubmited: (value){
                        _passwordFocusNode.requestFocus();
                      },
                      textInputAction:TextInputAction.next ,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text("Password",style: Constants.textfield,),
                        )),
                    CustomInput(
                      onChanged: (value){
                        _registerPassword = value;
                      },
                      focusNode: _passwordFocusNode,
                      isPasswordField: true,
                      onSubmited:(value){
                        _submitForm();
                      },
                    ),
                    CustomBtn(
                      outlineBtn: true,
                      btntext: "Create",
                      onPressed:(){
                       _submitForm();
                      },
                      isLoading: _registerFormLoading,


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
