import 'package:auto_size_text/auto_size_text.dart';
import 'package:chec_nest/constants.dart';
import 'package:chec_nest/core/utils/app_router.dart';
import 'package:chec_nest/core/utils/styles.dart';
import 'package:chec_nest/features/auth/sign_up/presentation/widgets/sign_up_text_field_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(

      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 80,right:80),
            child: AutoSizeText(
              minFontSize: 22,
              'Create an account',
              maxLines: 1,
              style: AppStyles.textStyleBold20,
            ),
          ),
          const SignUpTextFieldsContainer(),
          const SizedBox(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:width*.2,vertical: 5 ),
            child: Row(
              children: [
                Text('Do you have an account? \t',style: AppStyles.textStyleRegular14.copyWith(color: const Color(0xFFADB3BC)),),
                GestureDetector(onTap: (){
                  GoRouter.of(context).push(AppRouter.kLogin);

                },child: Text('Log In',style: AppStyles.textStyleRegular14.copyWith(color: kPrimaryColor),))
              ],
            ),
          ),


        ],
      ),
    );
  }
}
