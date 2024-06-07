import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PageView(
          children: const [
            Center(child: Text('BANNER 1'),),
            Center(child: Text('BANNER 2'),),
            Center(child: Text('BANNER 3'),),
          ],
        ),
      ),
    );
  }
}