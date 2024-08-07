import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryText extends StatelessWidget {
  // const CategoryText({super.key});

  final List<String> _categoryLabels = ['FOOD', 'VEGETABLE', 'EGG', 'TEA', 'DRINKS', 'DIY', 'HOME DECOR', 'STATIONERY'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoryLabels.length,
                    itemBuilder: (context, index) {
                      return ActionChip(
                        backgroundColor: Colors.yellow.shade900,
                        onPressed: () {},
                        label: Text(
                          _categoryLabels[index],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
