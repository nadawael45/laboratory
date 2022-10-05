import 'package:algomhoryalab/core/color_manager/color_manager.dart';
import 'package:algomhoryalab/core/image_manager/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_circle_container.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: 100.w,
          height: 50.h,
          decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only
                (bottomLeft: Radius.circular(50),bottomRight:Radius.circular(50) )),
           child: 
           ClipRRect(child: Image.asset(ImageManager.background,fit: BoxFit.fill,),borderRadius:  BorderRadius.only
             (bottomLeft: Radius.circular(50),bottomRight:Radius.circular(50) ),),

        ),
        SizedBox(height: 70,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          CircleContainer(text: 'results',icon: Icons.query_stats,color: ColorsManager.blueColor,),
            CircleContainer(text: 'share',icon: Icons.share,color: ColorsManager.lightGreyColor,),

          ],),
        SizedBox(height: 50,),

        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleContainer(text: 'location',icon: Icons.map,color: ColorsManager.lightRedColor,),
            CircleContainer(text: 'profile',icon: Icons.person,color: ColorsManager.redColor,),

          ],),



      ],),
    );
  }
}
