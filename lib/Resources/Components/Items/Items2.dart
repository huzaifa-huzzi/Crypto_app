import 'package:flutter/material.dart';




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
      child:  Container(
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
      )
    );
  }
}

