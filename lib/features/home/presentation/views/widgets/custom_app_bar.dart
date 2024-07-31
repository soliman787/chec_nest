import 'package:chec_nest/core/generated/assets.dart';
import 'package:chec_nest/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{
  final String title;

  const CustomAppBar({super.key, required this.title});




  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppStyles.textStyleBold18,
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.bagShopping,
              color: Colors.black,
            )),
        GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 36,
              height: 36,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(Assets.profile),
              ),
            )),
        const SizedBox(
          width: 20,
        )
      ],
      // )
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
