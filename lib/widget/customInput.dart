import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  final String hintText;
  final Function (String) onSubmited;
  final Function  (String) onChanged;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;

  CustomInput ({this.onSubmited,this.hintText,this.onChanged,this.focusNode,this.textInputAction,this.isPasswordField});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0,vertical: 8.0),
      decoration: BoxDecoration(
       color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: TextField(
        obscureText: _isPasswordField,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmited,
        textInputAction: textInputAction,
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
