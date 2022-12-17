import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.cyan,
      Colors.green,
      Colors.yellow,
    ];
    return Scaffold(
      
      backgroundColor: const Color(0xff1f1f1f),
      appBar: _customAppBar(),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 16,right: 10),
          shrinkWrap: true,
          itemCount: 10,
            itemBuilder: (context,index){
          return _buildNoteCard();
        }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 10,); },),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff54eedb),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  PreferredSize _customAppBar() {
    return PreferredSize(
      preferredSize: const Size(100, 80),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xff1f1f1f),
        width: double.infinity,
        height: 150,
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

  Widget _buildNoteCard() {
    return Container(
      padding:const  EdgeInsets.all(32),
      decoration: ShapeDecoration(
          color:Colors.primaries[Random().nextInt(Colors.primaries.length)],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),

        height: 200,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  const [
            Text(
              'Flutter tips',
              style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.w500),
            ),SizedBox(height: 20,),
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
}
