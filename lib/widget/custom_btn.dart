import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String btntext;
  final Function onPressed;
  final bool outlineBtn;

  CustomBtn({this.outlineBtn,this.onPressed,this.btntext});

  @override
  Widget build(BuildContext context) {

    bool _outlineBtn = outlineBtn ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent: Colors.white ,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),

        child: Center(
            child: Text("$btntext",style: TextStyle(
              fontSize: 16.0,
              color: _outlineBtn ? Colors.white : Colors.red,
              fontWeight: FontWeight.bold,
            ),)
        ),
      ),
    );
  }
}
