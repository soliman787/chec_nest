
import 'package:chec_nest/core/widgets/custom_error_widget.dart';
import 'package:chec_nest/core/widgets/custom_loading_indicator.dart';
import 'package:chec_nest/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:chec_nest/features/home/presentation/views/home_view/widgets/all_product_horizontal_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductHorizontalListView extends StatelessWidget {
  const AllProductHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (BuildContext context, HomeState state) {
        if(state is HomeSuccess){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => AllProductHorizontalListViewItem(productModel: state.products[index],),
              itemCount: (state.products.length)-4,


            ),
          );
        }
        else if(state is HomeFailure){
          return CustomErrorWidget(errMessage: state.errMessage);

        }
        else{
          return const CustomLoadingIndicator();

        }
      }


    );
  }
}
