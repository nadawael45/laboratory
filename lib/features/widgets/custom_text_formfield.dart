import 'package:algomhoryalab/core/color_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  bool readonly;
  Widget? suffixIcon;
  var keyBoardType;
  var controller;
  var validate;
  var function;
  var onTap;
  String? text;
  CustomTextFormField({ this.hintText,this.controller,this.onTap,this.text,
    this.validate,this.function,this.keyBoardType,this.suffixIcon,
    this.readonly=false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(

        validator: validate,
        controller: controller,
        readOnly:  readonly,
        keyboardType: keyBoardType,
        decoration: InputDecoration(

            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 3.0,),
              borderRadius: BorderRadius.circular(5),
            ) ,
            hintText: hintText!,
            suffixIcon: suffixIcon
            ,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 11.sp,







            )),



      ),
    );
  }
}