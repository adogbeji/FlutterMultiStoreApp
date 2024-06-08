import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  // const BannerWidget({super.key});
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // Stores cloud_firestore package
  final List _bannerImages = []; // Stores banner images

  // RETRIEVES BANNERS FROM FIRESTORE DATABASE
  getBanners() {
    return _firestore.collection('banners').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          setState(() {
            _bannerImages.add(doc['image']);
          });
        });
      },
    );
  }

  @override
  void initState() {
    getBanners(); // FUNCTION CALLED AS SOON AS PAGE GETS LOADED
    super.initState();
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
        child: PageView.builder(
          itemCount: _bannerImages.length,
          itemBuilder: (context, index) {
            return Image.network(_bannerImages[index]);
          },
        ),
      ),
    );
  }
}
