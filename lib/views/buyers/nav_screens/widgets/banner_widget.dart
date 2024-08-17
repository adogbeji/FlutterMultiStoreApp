import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

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
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // child: Image.network(
              //   _bannerImages[index],
              //   fit: BoxFit.cover,
              // ),
              child: CachedNetworkImage(
                imageUrl: _bannerImages[index],
                fit: BoxFit.cover,
                // placeholder: (context, url) => const CircularProgressIndicator(),
                placeholder: (context, url) => Shimmer(
                  duration: Duration(seconds: 3), //Default value
                  interval: Duration(
                      seconds: 10), //Default value: Duration(seconds: 0)
                  color: Colors.white, //Default value
                  colorOpacity: 0, //Default value
                  enabled: true, //Default value
                  direction: ShimmerDirection.fromLTRB(), //Default Value
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            );
          },
        ),
      ),
    );
  }
}
