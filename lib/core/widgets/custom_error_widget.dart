import 'package:chec_nest/core/utils/styles.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: AppStyles.textStyleBold18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
