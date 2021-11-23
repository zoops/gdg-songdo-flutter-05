import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'route_getx/detail_page_03.dart';

class RouteWithGetx extends StatelessWidget {
  const RouteWithGetx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('RouteWithGetx'),
        const SizedBox(height: 10,),
        InkWell(
          onTap: () {
            Get.to(DetailPage03(str:'Getx 플러터앱'));
          },
          child: Container(
            color: Colors.green,
            child: const Text(
              'open detail',
              style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
            ),
          ),
        ),
      ],
    );
  }
}
