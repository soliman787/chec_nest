import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Color backgroundColor;
  const CustomButton({
    super.key, required this.text, required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SizedBox(
          width: 380,
          height: 44,
          child: ElevatedButton.icon(
            onPressed: () {
              // Define the action to perform on button press
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            label: Text(text),
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor, // Background color
              foregroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              textStyle: const TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
