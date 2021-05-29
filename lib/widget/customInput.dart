import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0,vertical: 8.0),
      decoration: BoxDecoration(
       color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 14.0,
          )
        ),
        style: Constants.regulartext,

      ),

    );
  }
}
