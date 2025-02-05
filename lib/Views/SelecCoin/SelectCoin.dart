import 'package:flutter/material.dart';


class SelectCoin extends StatelessWidget {
  final String image,title,symbol,currentPrice,marketChangePrice24H;
  const SelectCoin({super.key,required this.image,required this.title,required this.symbol,required this.currentPrice,required this.marketChangePrice24H});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: height  ,
            width: width,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: height * 0.08 ,
                      child: Image.network(image),
                    ),
                    SizedBox(width: width * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text(symbol,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.grey),)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$' + currentPrice,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                        Text(
                          marketChangePrice24H,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: double.tryParse(marketChangePrice24H) != null && double.parse(marketChangePrice24H) >= 0
                                ? Colors.green
                                : Colors.red,
                          ),
                        )

                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
