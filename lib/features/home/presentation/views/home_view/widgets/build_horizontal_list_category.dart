import 'package:chec_nest/core/generated/assets.dart';
import 'package:chec_nest/core/utils/app_router.dart';
import 'package:chec_nest/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildHorizontalListItems extends StatelessWidget {
  const BuildHorizontalListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 25),
      child: SizedBox(
        height: 112,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: buildHorizontalListItems(context),
        ),
      ),
    );
  }

  List<Widget> buildHorizontalListItems(BuildContext context) {
    return [
      buildCategoryItem(context, Assets.e_category, 'Electronics', 'electronics'),
      buildCategoryItem(context, Assets.jewelery_category, 'Jewelery', 'jewelery'),
      buildCategoryItem(context, Assets.men_clothing_category, 'Men\'s Clothing', 'men\'s clothing'),
      buildCategoryItem(context, Assets.women_clothing_category, 'Women\'s', 'women\'s clothing'),
    ];
  }

  Widget buildCategoryItem(BuildContext context, String imageAsset, String label, String categoryId) {
    return SizedBox(
      width: 84,
      height: 112,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kCategoryView.replaceAll(':id', categoryId));
        },
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset(imageAsset),
            ),
            Text(label, style: AppStyles.textStyleBold12,maxLines: 2,overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}
