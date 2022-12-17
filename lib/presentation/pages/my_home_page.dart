import 'package:flutter/material.dart';
import '../widgets/model_bottom_sheet.dart';
import '../widgets/widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      appBar: customAppBar(),
      body: itemsListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff54eedb),
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
              builder: (context) {
               return modalBottomSheet();
              }, context: context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
