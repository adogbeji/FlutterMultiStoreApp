import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 25, right: 15,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'What Are You Looking For? 👀',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: SvgPicture.asset(
              'assets/icons/cart.svg',
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
