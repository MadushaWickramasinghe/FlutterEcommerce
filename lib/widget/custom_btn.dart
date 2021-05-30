import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String btntext;
  final Function onPressed;
  final bool outlineBtn;
  final bool isLoading;

  CustomBtn({this.outlineBtn,this.onPressed,this.btntext,this.isLoading});

  @override
  Widget build(BuildContext context) {

    bool _outlineBtn = outlineBtn ?? false;
    bool _isLoading = isLoading ?? false;

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

        child: Stack(
         children: [
           Visibility(
             visible: _isLoading ? false : true,
             child: Center(
               child: Text( btntext ?? "Text",
                    style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold),
               ),
             ),
           ),
           Visibility(
             visible:_isLoading ,
             child: Center(
               child: SizedBox(
                 height: 30.0,
                 width: 30.0,
                 child: CircularProgressIndicator(),
               ),
             ),
           ),
         ],
        ),
      ),
    );
  }
}
