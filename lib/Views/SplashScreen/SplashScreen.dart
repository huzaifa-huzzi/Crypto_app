import 'package:crypto_app/Resources/Colors/Colors.dart';
import 'package:crypto_app/Views/DashBoardScreen/DashBoardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            SizedBox(height: height * 0.06,),
            /// Image
            Image.asset('assets/images/1.blue.jpg'),
            SizedBox(height: height * 0.03,),
            /// Texts
            const Column(
              children: [
                Text('The Future',style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold ),),
                Text('Learn more about cryptocurrency ,look to',style: TextStyle(fontSize: 20,fontWeight:FontWeight.normal,color: Colors.grey ),),
                Text('The Future in ID Crypto',style: TextStyle(fontSize: 20,fontWeight:FontWeight.normal,color: Colors.grey),),
              ],
            ),
            SizedBox(height: height * 0.08,),
            /// Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.14),
              child: InkWell(
                onTap: (){
                  Get.to(() => const DashboardScreen());
                },
                child: Container(
                   decoration: BoxDecoration(
                     color: AppColors.primary,
                     borderRadius: BorderRadius.circular(50),
                   ),
                  child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: width * 0.05 ,vertical: height *0.013),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text('CREATE PORTFOLIO',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                        RotationTransition(turns: AlwaysStoppedAnimation(310/360),
                        child: Icon(Icons.arrow_forward_rounded),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ) ,
    );
  }
}
