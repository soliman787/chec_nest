import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        actions: [IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.ellipsisVertical))],
      ),
      body: const LoginViewBody(),
    );
  }
}
