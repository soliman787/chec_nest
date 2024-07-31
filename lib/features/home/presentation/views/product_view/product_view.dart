import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:chec_nest/features/home/presentation/views/product_view/widgets/product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductView extends StatelessWidget {
  final ProductModel product;

  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProductViewBody(product: product),
    );
  }
}
