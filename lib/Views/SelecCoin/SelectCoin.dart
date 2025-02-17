import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:crypto_app/Models/ChartModel.dart';
import 'package:crypto_app/View_Model/crypto_view_Model.dart';
import '../../Resources/Colors/Colors.dart';

class SelectCoin extends StatefulWidget {
  final String image, title, symbol, currentPrice, marketChangePrice24H, low24H, high24H, totalVolume;

  const SelectCoin({
    Key? key,
    required this.image,
    required this.title,
    required this.symbol,
    required this.currentPrice,
    required this.marketChangePrice24H,
    required this.low24H,
    required this.high24H,
    required this.totalVolume,
  }) : super(key: key);

  @override
  State<SelectCoin> createState() => _SelectCoinState();
}

class _SelectCoinState extends State<SelectCoin> {
  List<String> text = ['D', 'W', 'M', '3M', '6M', 'Y'];
  List<bool> textBool = [false, false, true, false, false, false];
  int selectedTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(height: height * 0.08, child: Image.network(widget.image)),
                            SizedBox(width: width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                SizedBox(height: height * 0.01),
                                Text(widget.symbol, style: const TextStyle(fontSize: 20, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('\$${widget.currentPrice}', style: const TextStyle(fontSize: 20, color: Colors.black)),
                            SizedBox(height: height * 0.01),
                            Text('${widget.marketChangePrice24H}%',
                                style: TextStyle(fontSize: 16, color: double.parse(widget.marketChangePrice24H) >= 0 ? Colors.green : Colors.red)),
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
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Low',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                '\$${widget.low24H}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'High',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                '\$${widget.high24H}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Volume',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                '\$${widget.totalVolume}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Chart Section
                  FutureBuilder<List<ChartModel>>(
                    future: CryptoViewModel().fetchChartApi(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator(color: AppColors.primary));
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        final List<CandleData> candleData = snapshot.data!
                            .map((data) => CandleData(data.timestamp.toDouble(), data.open, data.high, data.low, data.close))
                            .toList();
                        return SizedBox(
                          height: height * 0.4,
                          width: width,
                          child: SfCartesianChart(
                            primaryXAxis: NumericAxis(),
                            primaryYAxis: NumericAxis(),
                            series: <CandleSeries>[
                              CandleSeries<CandleData, double>(
                                dataSource: candleData,
                                xValueMapper: (CandleData data, _) => data.timestamp,
                                lowValueMapper: (CandleData data, _) => data.low,
                                highValueMapper: (CandleData data, _) => data.high,
                                openValueMapper: (CandleData data, _) => data.open,
                                closeValueMapper: (CandleData data, _) => data.close,
                                bullColor: Colors.green,
                                bearColor: Colors.red,
                              )
                            ],
                          ),
                        );
                      } else {
                        return const Center(child: Text('No data available'));
                      }
                    },
                  ),
                  // Time Filters
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: text.asMap().entries.map((entry) {
                      int index = entry.key;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = index;
                            textBool = List.generate(text.length, (i) => i == selectedTabIndex);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                          child: Text(entry.value, style: TextStyle(fontSize: 18, color: textBool[index] ? AppColors.primary : Colors.grey)),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                      padding: EdgeInsets.only(right: width * .80),
                      child: Text('News', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))),
                  SizedBox(height: height * 0.01),
                  // Scrollable news text section, keeping the CircleAvatar in its place
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac mauris lorem. Nam nunc mi, vulputate non tristique eu, eleifend non velit. Phasellus tincidunt auctor nisl, id blandit magna auctor sed. Ut ac nisi sit amet odio pharetra aliquet. Donec lacinia malesuada justo, sit amet elementum felis pretium eu. Cras feugiat lobortis metus eget rutrum. Suspendisse eu metus justo. Quisque pulvinar, mi sit amet rutrum consectetur, turpis elit fringilla erat, quis condimentum lacus ante sit amet ligula. In sed condimentum ipsum.',
                              style: TextStyle(fontSize: 13, color: Colors.grey.withOpacity(0.7)),
                              textAlign: TextAlign.justify, // Justifies the text
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.05),
                        child: CircleAvatar(
                          radius: 35, // Increased the size of the avatar
                          backgroundImage: AssetImage('assets/images/11.PNG'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02), // Add some space after news section
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // White background for the bottom container
                padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text('Add to Portfolio', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                        vertical: height * 0.01
                      ),
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('assets/icons/3.1.png', height: height * 0.03, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CandleData {
  final double timestamp;
  final double open;
  final double high;
  final double low;
  final double close;

  CandleData(this.timestamp, this.open, this.high, this.low, this.close);
}
