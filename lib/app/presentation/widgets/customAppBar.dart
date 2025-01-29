import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final String? leadingIcon;
  final String? trailingIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      // backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 80,
      leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/$leadingIcon.svg',
            width: 36,
            height: 36,
            fit: BoxFit.contain,
          )),
      actions: [
        Transform.translate(
          offset: const Offset(-10, 0),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/$trailingIcon.svg',
              width: 31,
              height: 31,
              fit: BoxFit.contain,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
