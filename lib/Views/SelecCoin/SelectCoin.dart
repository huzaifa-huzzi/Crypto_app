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
                          child: Image.network(widget.image),
                        ),
                        SizedBox(width: width * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              widget.symbol,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${widget.currentPrice}',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          '${widget.marketChangePrice24H}%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: double.tryParse(widget.marketChangePrice24H) != null &&
                                double.parse(widget.marketChangePrice24H) >= 0
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
              FutureBuilder<List<ChartModel>>(
                future: CryptoViewModel().fetchChartApi(),
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
                    final List<ChartData> chartData = snapshot.data!
                        .map((data) => ChartData(data.timestamp.toDouble(), data.close))
                        .toList();

                    return Container(
                      height: height * 0.4,
                      width: width,
                      child: SfCartesianChart(
                        primaryXAxis: NumericAxis(),
                        primaryYAxis: NumericAxis(),
                        series: <CartesianSeries>[
                          LineSeries<ChartData, double>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.timestamp,
                            yValueMapper: (ChartData data, _) => data.close,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
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

class ChartData {
  final double timestamp;
  final double close;

  ChartData(this.timestamp, this.close);
}