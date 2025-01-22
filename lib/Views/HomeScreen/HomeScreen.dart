import 'package:crypto_app/Resources/Colors/Colors.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return  Scaffold(
       body: Container(
               height: height,
         width: width,
         decoration: BoxDecoration(
           color: AppColors.primary,
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Padding(
               padding: EdgeInsets.symmetric(vertical: height * 0.06),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: height *0.005),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('Main Portfolio',style: TextStyle(fontSize: 18,color: Colors.white),),
                  ),
                   Text('Top 10 coins',style: TextStyle(fontSize: 18,color: Colors.white),),
                   Text('Experimental',style: TextStyle(fontSize: 18,color: Colors.white),)
                 ],
               ),
             ),
             Padding(
                 padding: EdgeInsets.symmetric(horizontal: width *0.05),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('\$ 7,466.20',style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                     Container(
                       padding: EdgeInsets.all(width * 0.015),
                       height: height * 0.04,
                       width:  width * 0.1,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.white.withOpacity(0.5),
                       ),
                       child: Image.asset('assets/icons/5.1.png',height: height * 0.01,color: Colors.white,),
                     )
                   ],
                 ),
             ),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: width * 0.07),
               child:Row(
                 children: [
                   Text(
                     '+ 162% all time',
                     style: TextStyle(fontSize: 16,color: Colors.white),
                   ),
                 ],
               )
             ),
             SizedBox(
               height:  height * 0.05,
             ),
             Container(
               height: height * 0.6,
               width: width,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                   topRight: Radius.circular(50),
                   topLeft: Radius.circular(50),
                 )
               ),
               child: Column(
                 children: [
                   SizedBox(
                     height:  height * 0.02,
                   ),
                   Padding(
                       padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                     child: Row(
                       mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                       children: [
                         Text('Assets',style: TextStyle(fontSize: 20),),
                         Icon(Icons.add),
                       ],
                     ),
                   ),
                   Expanded(child: ListView.builder(
                       itemCount: 10,
                       itemBuilder: (context,index){
                          return Text('data');
                       },
                   ))
                 ],
               ) ,
             )
           ],
         ),
       ),
    );
  }
}
