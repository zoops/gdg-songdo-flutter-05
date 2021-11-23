import 'package:flutter/material.dart';
import 'package:flutter_app/page/rooute.dart';
import 'package:flutter_app/page/rooute_getx.dart';
import 'package:flutter_app/page/route/detail_page_02.dart';
import 'package:flutter_app/page/state_getx/mycontroller.dart';
import 'package:get/get.dart';

import 'page/route_getx/detail_page_04.dart';
import 'page/state.dart';
import 'page/state_getx.dart';

void main() {
  runApp( GetMaterialApp(
      title: 'MyApp',
      home: const MyApp(),
      routes: {
        'detailpage02': (context) => const DetailPage02(),
      },
      initialBinding: BindingsBuilder(() {
        Get.put(MyController());
      }),
      getPages: [
      	GetPage(
          name: '/detailpage04/:val',
          page: () => const DetailPage04(),
        )
      ],
    )
  );
}
/*

Get.toNamed('/papa/value?id=123&name=침착맨');
Get.parameters['param']
Get.parameters['id']
Get.parameters['name']

 */
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _selectedIndex = 0;

  final List _widgetOptions = [
    const RouteWithNavigator(),
    const RouteWithGetx(),
    StateWithSetState(),
    StateWithGetx(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('플러터앱'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '라우트',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: '라우트 getx',
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: 'state',
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            label: 'state getx',
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

}
