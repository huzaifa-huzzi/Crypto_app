import 'package:crypto_app/Models/Coins_Model.dart';
import 'package:crypto_app/View_Model/crypto_view_Model.dart';
import 'package:crypto_app/Views/SelecCoin/SelectCoin.dart';
import 'package:flutter/material.dart';

import '../../Colors/Colors.dart';



class Items2 extends StatelessWidget {
  final String image;
  final String title, currentPrice, changeofprice;

  const Items2({
    super.key,
    required this.image,
    required this.title,
    required this.currentPrice,
    required this.changeofprice,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.03,
        right: width * 0.05,
        top: height * 0.02
      ),
      child:  FutureBuilder<List<Coins_Model>>(
        future: CryptoViewModel().fetchCoinsApi(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData &&
              snapshot.data!.isNotEmpty) {
            return ListView.builder(
                itemBuilder: (BuildContext context,index){
                  return GestureDetector(
                    onTap: (){
                      SelectCoin(
                          image: snapshot.data![index].image.toString(),
                          title: snapshot.data![index].name.toString(),
                          symbol: snapshot.data![index].id.toString(),
                          currentPrice: snapshot.data![index].currentPrice.toString(),
                          marketChangePrice24H: snapshot.data![index].marketCapChangePercentage24h.toString(),
                          low24H: snapshot.data![index].low24h.toString(),
                          high24H: snapshot.data![index].high24h.toString(),
                          totalVolume: snapshot.data![index].totalVolume.toString()
                      );

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          image.isNotEmpty
                              ? SizedBox(
                            height: height * 0.03,
                            child: Image.network(
                              image,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.broken_image, size: height * 0.03),
                            ),
                          )
                              : Icon(Icons.broken_image, size: height * 0.03),
                          SizedBox(height: height * 0.01),
                          Text(
                            title.isNotEmpty ? title : 'Unknown Title',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: height * 0.03),
                          Row(
                            children: [
                              Text(
                                currentPrice.isNotEmpty ? currentPrice : '0.00',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: width * 0.03),
                              Text(
                                '${ changeofprice.isNotEmpty ? changeofprice : '0%'}%',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}

