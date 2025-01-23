import 'package:flutter/material.dart';


class Items extends StatelessWidget {
   var image;
   final String title,subtitile;
   Items({super.key,this.image,required this.title,required this.subtitile});

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
             )
           ],
        ),
      ),
    );
  }
}
