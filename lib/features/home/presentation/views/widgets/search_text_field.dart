import 'package:chec_nest/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width * .8,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey), // Grey border when not focused
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff171A1F)), // Customize focused border color if needed
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              color:Color(0xff171A1F),
              Icons.search,
              size: 18,
            ),
          ),
          border: OutlineInputBorder(

            borderSide: const BorderSide(color: Colors.transparent),
            // Set border color to grey
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          hintStyle: AppStyles.textStyleRegular14.copyWith(color: const Color(0xffBCC1CA)),
          hintText: "Search for product",
          fillColor: Colors.white70,
        ),
      ),
    );
  }
}
