import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      width: width*(380/width),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: const Color(0xffF3F4F6),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Text(
          'See all',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
