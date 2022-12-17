import 'package:flutter/material.dart';

PreferredSize customAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: Container(
      margin: const EdgeInsets.only(top: 16),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      color: const Color(0xff1f1f1f),
      child: Row(
        children: [
          const Text(
            'Notes',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          const Spacer(),
          Container(
            decoration: ShapeDecoration(
                color: const Color(0xff3b3b3b),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            width: 45,
            height: 45,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 32,
                  color: Colors.white,
                )),
          )
        ],
      ),
    ),
  );
}