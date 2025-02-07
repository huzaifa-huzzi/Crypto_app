import 'package:crypto_app/View_Model/Controllers/Crypto_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final SelectCoinController controller = Get.put(SelectCoinController());

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
              // Header Section
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
                        Text('\$${widget.currentPrice}', style: const TextStyle(fontSize: 20)),
                        SizedBox(height: height * 0.01),
                        Text(
                          '${widget.marketChangePrice24H}%',
                          style: TextStyle(
                            fontSize: 16,
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
              // Tab Selection (Just switching between tabs without fetching data)
              SizedBox(
                height: height * 0.03,
                child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.tabs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: GestureDetector(
                        onTap: () => controller.updateSelectedTab(index),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: height * 0.005),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: controller.selectedTabIndex.value == index
                                ? AppColors.primary.withOpacity(0.5)
                                : Colors.transparent,
                          ),
                          child: Text(
                            controller.tabs[index],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
