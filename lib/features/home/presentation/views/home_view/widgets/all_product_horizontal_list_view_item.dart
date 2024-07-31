import 'package:chec_nest/constants.dart';
import 'package:chec_nest/core/utils/styles.dart';
import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllProductHorizontalListViewItem extends StatelessWidget {

  final ProductModel productModel;
  const AllProductHorizontalListViewItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push('/ProductView', extra: productModel);

      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  productModel.image,
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),
               Text(
                productModel.title.substring(0,10),
                style: AppStyles.textStyleBold12
              ),
              const SizedBox(height: 8.0),
               Row(
                children: [

                  const SizedBox(width: 4.0),
                   Text(
                      productModel.title.substring(0,18),
                    style: AppStyles.textStyleRegular11,
                     overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 21,),
                  Text(
                      '\$${productModel.price}',
                      style: AppStyles.textStyleRegular14.copyWith(color: kPrimaryColor,fontWeight: FontWeight.bold)
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
