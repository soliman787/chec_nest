import 'package:chec_nest/core/generated/assets.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 332,
      child: GridView.count(
        crossAxisCount: 2,
        children: _buildGridItems(), // Using the method to generate items
      ),
    )
    ;
  }
  List<Widget> _buildGridItems() {
    List<Widget> items = [];
    for (int i = 0; i < 4; i++) {
      if(i%2==0){
        items.add(Container(
          width: 160,
          height: 128,
          decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(16))),
          margin: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.item2),
        ));

      }else{
        items.add(Container(
          width: 160,
          height: 128,
          margin: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.item1),
        ));

      }

    }
    return items;
  }

}
