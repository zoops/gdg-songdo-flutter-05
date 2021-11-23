import 'package:flutter/material.dart';

class DetailPage02 extends StatelessWidget {
  const DetailPage02({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage02'),
      ),
      body: Column(
        children: [
          Text('DetailPage02 $args'),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, '동해물과 백두산이');
            },
            child: const Text("DetailPage02 close"),
          ),
        ],
      ),
    );
  }
}
