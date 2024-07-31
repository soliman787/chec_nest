import 'package:chec_nest/core/utils/app_router.dart';
import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerticalListViewItem extends StatelessWidget {
  const VerticalListViewItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/ProductView', extra: productModel);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Image
              SizedBox(
                width: 60,
                height: 60,
                child: Image.network(
                  productModel.image,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 10,),
              // Text and Rating
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title.substring(0, 10),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < productModel.rating!.rate
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),

              Expanded(
                child: Column(
                  children: [
                    const Icon(
                      Icons.add_circle,
                      color: Colors.green,
                      size: 24.0,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${productModel.price}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
