import 'package:chec_nest/constants.dart';
import 'package:flutter/material.dart';

class QuantitySection extends StatefulWidget {
  final int initialQuantity;
  final double pricePerItem;
  final ValueChanged<int> onQuantityChanged;

  const QuantitySection({
    super.key,
    required this.initialQuantity,
    required this.pricePerItem,
    required this.onQuantityChanged,
  });

  @override
  QuantitySectionState createState() => QuantitySectionState();
}

class QuantitySectionState extends State<QuantitySection> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      widget.onQuantityChanged(_quantity);
    });
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
        widget.onQuantityChanged(_quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double total = _quantity * widget.pricePerItem;

    return SizedBox(
      height: 86,
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quantity',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.remove, size: 16),
                          onPressed: _decrementQuantity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '$_quantity',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: kPrimaryColor, // Change this to kPrimaryColor if you have a predefined primary color
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.add, size: 16),
                          color: Colors.white,
                          onPressed: _incrementQuantity,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    'Total : \$ ${total.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}