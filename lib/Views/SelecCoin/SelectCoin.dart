import 'package:crypto_app/Models/ChartModel.dart';
import 'package:crypto_app/View_Model/crypto_view_Model.dart';
import 'package:flutter/material.dart';

import '../../Resources/Colors/Colors.dart';

class SelectCoin extends StatelessWidget {
  final String image, title, symbol, currentPrice, marketChangePrice24H, low24H, high24H, totalVolume;

  const SelectCoin({
    super.key,
    required this.image,
    required this.title,
    required this.symbol,
    required this.currentPrice,
    required this.marketChangePrice24H,
    required this.low24H,
    required this.high24H,
    required this.totalVolume,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: height * 0.08,
                          child: Image.network(image),
                        ),
                        SizedBox(width: width * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              symbol,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$$currentPrice',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          '$marketChangePrice24H%',
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
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Low
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Low',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            '\$$low24H',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    // Spacer for better separation
                    SizedBox(width: width * 0.05),

                    // High
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'High',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            '\$$high24H',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: width * 0.05),

                    // Volume
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Volume',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            '\$${totalVolume.substring(0, totalVolume.length > 6 ? 6 : totalVolume.length)}M',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder<ChartModel>(
                future: CryptoViewModel().fetchChartsApi(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.primary),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    return   Container(
                      height: height * 0.4,
                      width: width,
                      color: Colors.amber,
                    );
                  } else {
                    return const Center(
                      child: Text('No data available'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
