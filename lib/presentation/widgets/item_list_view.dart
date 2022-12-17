
import 'dart:math';

import 'package:flutter/material.dart';

Widget itemsListView() {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
    child: ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildNoteItem();
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    ),
  );
}



Widget _buildNoteItem() {
  return Container(
      padding: const EdgeInsets.all(32),
      decoration: ShapeDecoration(
          color: Colors.accents[Random().nextInt(Colors.accents.length)],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16))),
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Flutter tips',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Build Your Career With',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Text(
                'Omar Sayed',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.black,
                  )),
              const Text(
                'May 21,2022',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          )
        ],
      ));
}