import 'package:algomhoryalab/features/widgets/custom_text.dart';
import 'package:flutter/material.dart';
class CircleContainer extends StatelessWidget {
  Color? color;
  IconData? icon;
  String? text;
  var function;

  CircleContainer({this.color, this.icon, this.text,this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap:function,
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(70),
              color: color,
            ),
            child: Icon(icon,color: Colors.white,size: 35,),
          ),
        ),
        SizedBox(height: 10,),
        CustomText(text: text,)
      ],
    );
  }
}
