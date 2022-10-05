import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/color_manager/color_manager.dart';
import 'custom_text.dart';
class CustomButton extends StatelessWidget {
  String? text;
  var function;

  CustomButton(this.text, this.function);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: MediaQuery.of(context).size.width,
           height: 42.sp,
           decoration: BoxDecoration(
             color: ColorsManager.redColor,
             borderRadius: BorderRadius.circular(10),

           ),
          child: Center(
            child: CustomText(text: text,fontWeight: FontWeight.bold,color: Colors.white,txtSize: 12.sp,
            ),
          )),
    );
  }
}
