import 'package:crypto_app/Models/Coins_Model.dart';
import 'package:crypto_app/Resources/Colors/Colors.dart';
import 'package:crypto_app/Resources/Components/Items/Items.dart';
import 'package:crypto_app/Resources/Components/Items/Items2.dart';
import 'package:crypto_app/View_Model/crypto_view_Model.dart';
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

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: AppColors.primary,
        ),
        child: Column(
          children: [
            /// Top section
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: height * 0.005),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Main Portfolio',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const Text(
                    'Top 10 coins',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const Text(
                    'Experimental',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
            ),
            /// Middle section with current price and icon
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '\$ 7,466.20',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(width * 0.015),
                    height: height * 0.04,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: Image.asset(
                      'assets/icons/5.1.png',
                      height: height * 0.01,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            /// Small text row
            Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: const Row(
                  children: [
                    Text(
                      '+ 162% all time',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                )),
            SizedBox(
              height: height * 0.02,
            ),
            /// Bottom white scrollable container
            Expanded(
              child: Container(
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.02),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Assets',
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(Icons.add),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        FutureBuilder<List<Coins_Model>>(
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
                              final coins = snapshot.data!.take(4).toList();
                              return Column(
                                children: coins.map((coin) {
                                  final prices = coin.sparklineIn7d?.price
                                      ?.map((e) => e.toDouble())
                                      .toList() ??
                                      [];

                                  return Items(
                                    image: coin.image ?? '',
                                    title: coin.name ?? 'Unknown',
                                    subtitile: '0.4 ${coin.symbol ?? ''}',
                                    Price: prices,
                                    marketCap: coin.marketCapChange24h
                                        ?.toStringAsFixed(2) ??
                                        '0.00',
                                    changeofprice:
                                    coin.marketCapChangePercentage24h
                                        .toString(),
                                    currentPrice: coin.currentPrice
                                        ?.toStringAsFixed(2) ??
                                        '0.00',
                                  );
                                }).toList(),
                              );
                            } else {
                              return const Center(
                                child: Text('No data available'),
                              );
                            }
                          },
                        ),
                        SizedBox(height: height * 0.03),
                         const Text(
                          'Recommended to Buy',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: height * 0.02),
                        FutureBuilder<List<Coins_Model>>(
                          future: CryptoViewModel().fetchCoinsApi(),
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(color: AppColors.primary),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                              final coins = snapshot.data!.take(4).toList();
                              return SizedBox(
                                height: height * 0.23,
                                width: width,
                                child: ListView.builder(
                                  itemCount: coins.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final coin = coins[index];
                                    return Items2(
                                      image: coin.image ?? '',
                                      title: coin.name ?? 'Unknown',
                                      currentPrice: coin.currentPrice?.toStringAsFixed(2) ?? '0.00',
                                      changeofprice: coin.marketCapChangePercentage24h?.toStringAsFixed(2) ?? '0.00%',
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const Center(
                                child: Text('No data available'),
                              );
                            }
                          },
                        ),

                        SizedBox(height: height * 0.03),
                        const Text(
                          'Additional Content',
                          style: TextStyle(fontSize: 20),
                        ),
                        // Add more widgets/content here if needed
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



