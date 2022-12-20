import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressedIcon});

  final String title;
  final Widget icon;
  final VoidCallback? onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      // color: const Color(0xff1f1f1f),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
          const Spacer(),
          Container(
            decoration: ShapeDecoration(
                color: Colors.black54,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            width: 45,
            height: 45,
            child: IconButton(onPressed: onPressedIcon, icon: icon),
          )
        ],
      ),
    );
  }
}
