import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  // const BannerWidget({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Stores cloud_firestore package
  final List _bannerImages = [];  // Stores banner images

  // RETRIEVES BANNERS FROM FIRESTORE DATABASE
  getBanners() {
    return _firestore
        .collection('banners')
        .get()
        .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {});
        });
  }

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
            Center(
              child: Text('BANNER 1'),
            ),
            Center(
              child: Text('BANNER 2'),
            ),
            Center(
              child: Text('BANNER 3'),
            ),
          ],
        ),
      ),
    );
  }
}
