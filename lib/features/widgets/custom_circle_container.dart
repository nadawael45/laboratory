import 'package:algomhoryalab/features/widgets/custom_text.dart';
import 'package:flutter/material.dart';
class CircleContainer extends StatelessWidget {
  Color? color;
  IconData? icon;
  String? text;

  CircleContainer({this.color, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(70),
            color: color,
          ),
          child: Icon(icon,color: Colors.white,size: 35,),
        ),
        SizedBox(height: 10,),
        CustomText(text: text,)
      ],
    );
  }
}
