import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryText extends StatelessWidget {
  // const CategoryText({super.key});

  final List<String> _categoryLabels = ['FOOD', 'VEGETABLE', 'EGG', 'TEA'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          const Text('Categories', style: TextStyle(fontSize: 19,),),

          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return ActionChip(label: Text(_categoryLabels[index]),);
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}