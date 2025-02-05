import 'package:flutter/material.dart';


class SelectCoin extends StatelessWidget {
  final String image,title,symbol,currentPrice,marketChangePrice24H,low24H,high24H,totalVolume;
  const SelectCoin({super.key,required this.image,required this.title,required this.symbol,required this.currentPrice,required this.marketChangePrice24H,required this.low24H,required this.high24H,required this.totalVolume});

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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05,vertical: height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                       children: [
                         Container(
                           height: height * 0.08 ,
                           child: Image.network(image),
                         ),
                         SizedBox(width:  width * 0.02,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                             SizedBox(height:  height * 0.01,),
                             Text(symbol,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.grey),)
                           ],
                         ),
                       ],
                     ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('\$' + currentPrice,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black),),
                          SizedBox(height:  height * 0.01,),
                          Text(
                            marketChangePrice24H + '%',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: double.tryParse(marketChangePrice24H) != null && double.parse(marketChangePrice24H) >= 0
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05,vertical: height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Low',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.grey),),
                          SizedBox(height:  height * 0.01,),
                          Text( '\$' + low24H,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black),),
                        ],
                      ),

                      Column(
                        children: [
                          Text('High',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.grey),),
                          SizedBox(height:  height * 0.01,),
                          Text( '\$' + high24H,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black),),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Volume',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.grey),),
                          SizedBox(height:  height * 0.01,),
                          Text( '\$' + totalVolume + 'M',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black),),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
