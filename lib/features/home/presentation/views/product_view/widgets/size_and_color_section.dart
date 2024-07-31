import 'package:chec_nest/constants.dart';
import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class SizeAndColorSection extends StatefulWidget {

  final ProductModel productModel;

  final List<Color> colors;
  final List<String> sizes;
  final Color selectedColor;
  final String selectedSize;
  final ValueChanged<Color> onColorSelected;
  final ValueChanged<String> onSizeSelected;

  const SizeAndColorSection({
    super.key,
    required this.colors,
    required this.sizes,
    required this.selectedColor,
    required this.selectedSize,
    required this.onColorSelected,
    required this.onSizeSelected, required this.productModel,
  });

  @override
  SizeAndColorSectionState createState() => SizeAndColorSectionState();
}

class SizeAndColorSectionState extends State<SizeAndColorSection> {
  late Color _selectedColor;
  late String _selectedSize;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.selectedColor;
    _selectedSize = widget.selectedSize;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Visibility(
            visible: widget.productModel.category == 'men\'s clothing' || widget.productModel.category == 'women\'s clothing',
            child: const Text(
              'Color',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Visibility(
            visible: widget.productModel.category == 'men\'s clothing' || widget.productModel.category == 'women\'s clothing',
            child: Row(
              children: widget.colors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                    widget.onColorSelected(color);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedColor == color
                            ? Colors.orange // Replace with kPrimaryColor if needed
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    width: 40,
                    height: 40,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          Visibility(
            visible: widget.productModel.category != 'electronics',
            child: const Text(
              'Size',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Visibility(
            visible: widget.productModel.category != 'electronics',
            child: Row(
              children: widget.sizes.map((size) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSize = size;
                    });
                    widget.onSizeSelected(size);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: _selectedSize == size
                          ? kPrimaryColor // Replace with kPrimaryColor if needed
                          : Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.grey, // This adds a grey border
                        width: 1.0, // Adjust the width as needed
                      ),
                    ),
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    child: Text(
                      size,
                      style: TextStyle(
                        color: _selectedSize == size
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}