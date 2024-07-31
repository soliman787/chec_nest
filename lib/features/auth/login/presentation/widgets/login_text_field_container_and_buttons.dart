import 'package:chec_nest/constants.dart';
import 'package:chec_nest/core/utils/app_router.dart';
import 'package:chec_nest/core/utils/styles.dart';
import 'package:chec_nest/core/widgets/custom_button.dart';
import 'package:chec_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginTextFieldsAndButtonContainer extends StatefulWidget {
  const LoginTextFieldsAndButtonContainer({
    super.key,
  });

  @override
  State<LoginTextFieldsAndButtonContainer> createState() =>
      _LoginTextFieldsAndButtonContainerState();
}

class _LoginTextFieldsAndButtonContainerState
    extends State<LoginTextFieldsAndButtonContainer> {
  // bool _isSigningInWithEmail = false;
  // bool _isSigningInWithGoogle = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 35, left: 20, right: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFiled(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                controller: _emailController,
                passwordHide: false,
                hintText: 'Email',
                prefixIcon: const Icon(
                  FontAwesomeIcons.user,
                  size: 25,
                ),
              ),
              CustomTextFiled(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                controller: _passwordController,
                passwordHide: true,
                hintText: 'Password',
                prefixIcon: const Icon(
                  FontAwesomeIcons.lock,
                  size: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 11, bottom: 14, left: 180),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'I do not remember',
                    maxLines: 1,
                    style: AppStyles.textStyleRegular12
                        .copyWith(color: const Color(0xFFADB3BC)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),

                child: CustomButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kHome);

                  },
                  backgroundColor: kPrimaryColor,
                  text: 'Sign In',
                  textColor: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  buttonWidth: 343,
                  buttonHeight: 43,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  onTap: () {},
                  child:
                  Container(
                    width: 343,
                    height: 43,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Sign in with Google",
                            style: AppStyles.textStyleBold16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
//   void _signIn() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isSigningInWithEmail = true;
//       });
//
//       final String email = _emailController.text;
//       final String password = _passwordController.text;
//
//       final user = await _auth.signInWithEmailAndPassword(email, password);
//
//       setState(() {
//         _isSigningInWithEmail = true;
//       });
//
//       if (user != null) {
//         showToast(message: "User is successfully signed in");
//         GoRouter.of(context).push(AppRouter.kHome);
//       } else {
//         setState(() {
//           _isSigningInWithEmail = false;
//
//         });
//         showToast(message: "Invalid email or password");
//       }
//     }
//
//   }
//
//
//
//
//   _signInWithGoogle()async{
//
//     setState(() {
//       _isSigningInWithGoogle = true;
//     });    final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//     try {
//
//       final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//
//       if(googleSignInAccount != null ){
//         final GoogleSignInAuthentication googleSignInAuthentication = await
//         googleSignInAccount.authentication;
//
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken,
//         );
//
//         await _firebaseAuth.signInWithCredential(credential);
//         GoRouter.of(context).push(AppRouter.kHome);
//       }else{
//
//         setState(() {
//           _isSigningInWithGoogle = false;
//
//         });
//       }
//
//     }catch(e) {
//       setState(() {
//         _isSigningInWithGoogle = false;
//
//       });
//       showToast(message: "some error occurred $e");
//     }
//   }
// }
