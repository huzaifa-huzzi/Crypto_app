import 'package:flutter/material.dart';



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
      body:Container(
        child: Column(
          children: [
            Image.asset('assets/images/1.blue.jpg'),
            Text('The Future',style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold ),),
            Text('Learn more about cryptocurrency ,look to',style: TextStyle(fontSize: 20,fontWeight:FontWeight.normal,color: Colors.grey ),),
            Text('The Future in ID Crypto',style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold ),),
          ],
        ),
      ) ,
    );
  }
}
