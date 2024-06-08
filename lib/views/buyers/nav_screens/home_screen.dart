import 'package:flutter/material.dart';

import 'package:multi_store/views/buyers/nav_screens/widgets/welcome_text_widget.dart';
import 'package:multi_store/views/buyers/nav_screens/widgets/search_input_widget.dart';
import 'package:multi_store/views/buyers/nav_screens/widgets/banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WelcomeText(),
    
        const SizedBox(height: 14,),
    
        // SEARCH BAR 
        const SearchInputWidget(),
        BannerWidget(),
      ],
    );
  }
}