import 'package:chec_nest/core/utils/app_router.dart';
import 'package:chec_nest/core/utils/styles.dart';
import 'package:chec_nest/features/home/presentation/views/home_view/widgets/all_product_horizontal_list_view.dart';
import 'package:chec_nest/features/home/presentation/views/home_view/widgets/build_horizontal_list_category.dart';
import 'package:chec_nest/features/home/presentation/views/home_view/widgets/product_grid_view.dart';
import 'package:chec_nest/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SearchTextField(width: width),
          const BuildHorizontalListItems(),
          const ProductGridView(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                const Text('All Products',style: AppStyles.textStyleBold16,),
                const Spacer(),
                GestureDetector(onTap: (){
                  GoRouter.of(context).push(AppRouter.kVerticalAllProductView);

                },child: Text('View all',style: AppStyles.textStyleRegular14.copyWith(color:const Color(0xff9095A0)),))
              ],
            ),
          ),
          const SizedBox(height: 18,),
          const SizedBox(height: 208,child: AllProductHorizontalListView(),),
          const SizedBox(height: 24,)

        ],
      ),
    );


  }

}



