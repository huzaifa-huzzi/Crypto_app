import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';


class Items extends StatelessWidget {
   var image;
   final String title,subtitile;
   final List<double> Price;
   Items({super.key,this.image,required this.title,required this.subtitile,required this.Price});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06,vertical:  height * 0.02),
      child: Container(
        child: Row(
           children: [
          Container(
          height:  height * 0.05,
          child: Row(
            children: [
              Image.network(image),
            ],
          ),
        ),
             SizedBox(width:  width * 0.03,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                 Text(subtitile,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.grey),)
               ],
             ),
             SizedBox(width:  width * 0.05,),
             /// Infront chart lines
             Container(
               height: height * 0.05,
               width:  width * 0.2,
               child: Sparkline(
                   data: Price,
                  lineWidth: 2,
                 lineColor: Colors.red,
                 fillMode: FillMode.below,
                 fillGradient: LinearGradient(
                     colors: [Colors.red,Colors.red.shade100],
                     begin: Alignment.topCenter,
                   end: Alignment.bottomCenter,
                   stops: const [0.0,0.7],
                 ),
               ),
             )
           ],
        ),
      ),
    );
  }
}
