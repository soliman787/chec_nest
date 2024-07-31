import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String price;
  final String description;
  final double rating;
  final IconData icon;
  final Color iconColor;

  const ProductDescription({
    super.key,
    required this.price,
    required this.description,
    required this.rating,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(fontSize: 24, color: Colors.orange), // Replace Colors.orange with kPrimaryColor if you have a predefined primary color
              ),
              const SizedBox(
                height: 8,
              ),
              Text(description,maxLines: 2,overflow: TextOverflow.ellipsis,),
            ],
          ),
          const SizedBox(
            width: 88,
          ),
          Icon(
            icon,
            color: iconColor,
          ),
          Text('$rating'),
        ],
      ),
    );
  }
}