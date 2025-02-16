import 'package:auto_size_text/auto_size_text.dart';
import 'package:chec_nest/constants.dart';
import 'package:chec_nest/core/utils/app_router.dart';
import 'package:chec_nest/core/utils/styles.dart';
import 'package:chec_nest/features/auth/login/presentation/widgets/login_text_field_container_and_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         const Padding(
          padding: EdgeInsets.only(left: 39,right: 220),
          child: AutoSizeText(
            minFontSize: 22,
            'Welcome !',
            maxLines: 1,
            style: AppStyles.textStyleRegular14,
          ),
        ),
        const LoginTextFieldsAndButtonContainer(),
         const SizedBox(),
         Padding(
           padding: const EdgeInsets.only(left: 90,right: 64,top: 50),
           child: Row(
            children: [
              const Text('Don\'t have an account? ',style: AppStyles.textStyleRegular14,),
              GestureDetector(onTap: (){
                GoRouter.of(context).push(AppRouter.kSignUp);


              },child: Text('Register',style: AppStyles.textStyleRegular14.copyWith(color: kPrimaryColor),)),
            ],
                   ),
         )
        
      ],
    );
  }
}

