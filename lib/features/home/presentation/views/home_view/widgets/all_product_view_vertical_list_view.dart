import 'package:chec_nest/core/widgets/custom_error_widget.dart';
import 'package:chec_nest/core/widgets/custom_loading_indicator.dart';
import 'package:chec_nest/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:chec_nest/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:chec_nest/features/home/presentation/views/widgets/vertical_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductViewVerticalListView extends StatelessWidget {
  const AllProductViewVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'All Products',
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, HomeState state) {
        if (state is HomeSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemBuilder: (context, index) => VerticalListViewItem(
                productModel: state.products[index],
              ),
              itemCount: (state.products.length) - 4,
            ),
          );
        } else if (state is HomeFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      }),
    );
  }
}
