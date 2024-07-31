import 'package:chec_nest/core/generated/assets.dart';
import 'package:chec_nest/core/widgets/custom_error_widget.dart';
import 'package:chec_nest/core/widgets/custom_loading_indicator.dart';
import 'package:chec_nest/features/home/presentation/manager/category_product_cubit/category_product_cubit.dart';
import 'package:chec_nest/features/home/presentation/views/widgets/vertical_list_view_item.dart';
import 'package:chec_nest/features/home/presentation/views/category_view/widgets/photo_slider.dart';
import 'package:chec_nest/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key});

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  // final PageController _controller = PageController();
  final List<String> _images = [
    Assets.mob1,
    Assets.mob2,
    Assets.mob3,
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return 
    
        BlocBuilder<CategoryProductCubit, CategoryProductState>(
          builder: (BuildContext context, CategoryProductState state) {
            if (state is CategoryProductSuccess) {
              return SingleChildScrollView(

                child: Column(
                  children: [
                    Center(child: SearchTextField(width: width)),
                    const SizedBox(
                      height: 33.5,
                    ),
                    SizedBox(
                      width: width * (380 / width),
                      height: ((state.products.length) * 100),
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                             VerticalListViewItem(productModel: state.products[index],),
                        itemCount: state.products.length,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Visibility(
                      visible: state.products[0].category == 'electronics',
                      child: PhotoSlider(
                        images: _images,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is CategoryProductFailure) {
              return CustomErrorWidget(errMessage: state.errMessage);
            } else {
              return const CustomLoadingIndicator();
            }
          },
        

    );
  }
}
