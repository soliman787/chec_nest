import 'package:chec_nest/constants.dart';
import 'package:chec_nest/core/utils/styles.dart';
import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:chec_nest/features/home/presentation/views/product_view/widgets/product_description_section.dart';
import 'package:chec_nest/features/home/presentation/views/product_view/widgets/product_view_custom_button.dart';
import 'package:chec_nest/features/home/presentation/views/product_view/widgets/quantity_section.dart';
import 'package:chec_nest/features/home/presentation/views/product_view/widgets/size_and_color_section.dart';
import 'package:flutter/material.dart';

class ProductViewBody extends StatelessWidget {
  final ProductModel product;


  const ProductViewBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 5,),
           Center(child: Text(product.title,style: AppStyles.textStyleBold18,textAlign: TextAlign.center,)),
          const SizedBox(height: 20),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                product.image,
                height: 192,
                fit: BoxFit.fill,
              ),
            ), // Main T-shirt image widget here,
          ),
          const SizedBox(height: 34),
           ProductDescription(
            price: product.price.toString(),
            description: '${product.description.substring(0,30)}...',
            rating: 4.5,
            icon: Icons.star,
            iconColor: Colors.amber,
          ),
          SizeAndColorSection(
            productModel: product,
            colors: const [Colors.red, Colors.green, Colors.blue],
            sizes: const ['S', 'M', 'L', 'XL'],
            selectedColor: Colors.red,
            selectedSize: 'M',
            onColorSelected: (color) {},
            onSizeSelected: (size) {},
          ),
          QuantitySection(
            initialQuantity: 1,
            onQuantityChanged: (newQuantity) {},
            pricePerItem: 30,
          ),
          SizedBox(height: .08 *height,),
          const CustomButton(
            text: 'Add to cart',
            backgroundColor: kPrimaryColor,
          ),
          const CustomButton(
            text: 'Buy now',
            backgroundColor: Colors.orange,
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
