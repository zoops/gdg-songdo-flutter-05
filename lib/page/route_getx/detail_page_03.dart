import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_page_04.dart';

class DetailPage03 extends StatelessWidget {
  DetailPage03({Key? key, this.str}) : super(key: key);

  String? str;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage03'),
      ),
      body: Column(
        children: [
          Text('DetailPage03 $str!'),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () async {
              final result = await Get.toNamed('/detailpage04/valtest?str=한글은 아름답다') as String;
              Get.snackbar("return", result);
            },
            child: const Text("detailpage04 open"),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("DetailPage03 close"),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () async {
              final result = await Get.offNamedUntil('/detailpage04/valtest',
                  (Route<dynamic> route) {
                    return route.isFirst;
                  }, arguments: '한글은 아름답다') as String;
              Get.snackbar("return", result);
            },
            child: const Text("detailpage04 open and removeuntil"),
          ),

        ],
      ),
    );
  }
}
