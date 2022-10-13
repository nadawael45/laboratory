import 'package:algomhoryalab/core/image_manager/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sizer/sizer.dart';
import 'package:latlong2/latlong.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child:
          FlutterMap(
              options: MapOptions(center: LatLng(
                  31.118906981429987,30.94406732883565
              ),
                zoom: 13.0,


              )
            ,
           children: [
             TileLayer(
               urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
               subdomains: ['a', 'b', 'c'],
               // attributionBuilder: (_) {
               //   return Text("© OpenStreetMap contributors");
               // },
             ),
             MarkerLayer(markers: [
               Marker(
                 width: 80.0,
                 height: 80.0,
                 point: LatLng(
                     31.118906981429987,30.94406732883565),
                 builder: (ctx) =>
                     Container(
                       child: Icon(Icons.location_on,color: Colors.red,),
                     ),
               ),
             ],)
           ],
          ),
          ),
          Image.asset(ImageManager.img,fit: BoxFit.fill,width: 100.w,height: 50.sp,),
        ],
      );
  }
}


