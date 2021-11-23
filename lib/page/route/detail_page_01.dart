import 'package:flutter/material.dart';

import 'detail_page_02.dart';

class DetailPage01 extends StatelessWidget {
  DetailPage01({Key? key, this.str}) : super(key: key);

  String? str;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage01'),
      ),
      body: Column(
        children: [
          Text('DetailPage01 $str!'),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.pushNamed(
                context,
                'detailpage02',
                arguments: '한글은 아름답다',
              );

              ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('$result') ));

            },
            child: const Text("DetailPage02 open"),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("DetailPage01 close"),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.pushNamedAndRemoveUntil(
                context,
                'detailpage02',
                    (Route<dynamic> route) {
                  return route.isFirst;
                },
                arguments: '한글은 아름답다',
              );

              ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('$result') ));

            },
            child: const Text("DetailPage02 open and removeuntil"),
          ),

        ],
      ),
    );
  }
}
