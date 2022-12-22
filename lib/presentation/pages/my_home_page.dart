import 'package:flutter/material.dart';

import '../widgets/model_bottom_sheet.dart';
import '../widgets/widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff1f1f1f),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(
          title: 'Notes',
          icon: const Icon(
            Icons.search,
            size: 32,
            color: Colors.white,
          ),
          onPressedIcon: () {},
        ),
      ),
      body: itemsListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff54eedb),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              builder: (context) {
                return const ModelBottomSheet();
              },
              context: context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
