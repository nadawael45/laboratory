import 'package:algomhoryalab/core/color_manager/color_manager.dart';
import 'package:algomhoryalab/core/image_manager/image_manager.dart';
import 'package:algomhoryalab/features/screens/location.dart';
import 'package:algomhoryalab/features/widgets/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/custom_circle_container.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselController buttonCarouselController = CarouselController();

PageController pageController=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          width: 100.w,
          height: 100.sp,
       child: Image.asset(ImageManager.img,fit: BoxFit.fill,)
          // decoration: const BoxDecoration(
          //     color: Colors.orange,
          //     borderRadius: BorderRadius.only
          //       (bottomLeft: Radius.circular(50),bottomRight:Radius.circular(50) )),
          //  child:
          //  ClipRRect(child: Image.asset(ImageManager.background,fit: BoxFit.fill,),borderRadius:  BorderRadius.only
          //    (bottomLeft: Radius.circular(50),bottomRight:Radius.circular(50) ),),

        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Offers',color: ColorsManager.blueColor,fontWeight: FontWeight.bold,textAlign: TextAlign.start,),
              CustomText(text: 'see all',color: Colors.grey,fontWeight: FontWeight.normal,textAlign: TextAlign.start,),

            ],
          ),
        ),
          SizedBox(height: 25,),
          Container(
            height: 150.sp,
            width: double.infinity,
            child: PageView.builder(
              itemCount: 3,
              controller: pageController,
              itemBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    height: 150.sp,
                    width: 85.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                      color: Colors.red,


                    ),
                    child: ClipRRect(borderRadius: BorderRadius.circular(25),
                        child: Image.asset('assets/images/onboard.jpg',fit: BoxFit.fill,))),
              ),
            ),
          ),

        SizedBox(height: 20,),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect:  const WormEffect(
                dotHeight: 7,
                dotWidth: 14,
                type: WormType.thin,
                activeDotColor: ColorsManager.blueColor,
                dotColor: ColorsManager.lightGreyColor


                // strokeWidth: 5,
              ),
            ),
          ),
          SizedBox(height: 60,),


          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          CircleContainer(text: 'results',icon: Icons.query_stats,color: ColorsManager.blueColor,),
            CircleContainer(text: 'share',icon: Icons.share,color: ColorsManager.lightGreyColor,),

          ],),
        SizedBox(height: 50,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleContainer(text: 'location',icon: Icons.map,color: ColorsManager.lightRedColor,function:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Location()));
            } ,),
            CircleContainer(text: 'profile',icon: Icons.person,color: ColorsManager.redColor,),

          ],),



      ],),
    );
  }
}
