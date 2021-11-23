import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage04 extends StatelessWidget {
  const DetailPage04({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String? args = Get.parameters['str'];
    String? val = Get.parameters['val'] ?? 'null';
    if (args == null)
      args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('DetailPage04 $val'),
      ),
      body: Column(
        children: [
          Text('DetailPage04 $args'),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              Get.back(result: '동해물과 백두산이');
            },
            child: const Text("DetailPage04 close"),
          ),
        ],
      ),
    );
  }
}
