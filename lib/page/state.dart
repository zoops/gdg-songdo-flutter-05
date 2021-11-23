import 'dart:async';

import 'package:flutter/material.dart';

class StateWithSetState extends StatefulWidget {
  StateWithSetState({Key? key}) : super(key: key)
  {
    print('!!!!! StateWithSetState');
  }

  @override
  _StateWithSetStateState createState() => _StateWithSetStateState();
}

class _StateWithSetStateState extends State<StateWithSetState> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _list = [];

  _StateWithSetStateState() {
    print("!!!! _StateWithSetStateState");
  }

  add() {
    String inputText;
    if ((inputText = _textController.text) == '') return;

    setState(() {
      _list.add(inputText);
      _textController.text = '';
    });
  }

  @override
  void initState() {
    print("!!!! initState");
    super.initState();
  }


  @override
  void dispose() {
    print("!!!! dispose");
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            child: CustomListView(_list),
            flex: 5,
          ),
          Flexible(
              child: Container(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            hintText: '추가할 문자열을 입력하세요.',
                            enabledBorder: InputBorder.none,
                          ),
                          textInputAction: TextInputAction.go,
                          onSubmitted: (_) {
                            add();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          add();
                        },
                        child: const Text('추가'),
                      ),
                    )
                  ],
                ),
              ),
              flex: 1),
        ],
      ),
    );
  }
}


class CustomListView extends StatelessWidget {
  final List<String> _list;
  final _controller = ScrollController();
  
  static const List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  CustomListView(this._list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _controller,
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == (_list.length-1))
          Timer(
            Duration(milliseconds: 10),
                () => _controller.jumpTo(_controller.position.maxScrollExtent),
          );

          return Card(
            color: colors[index % colors.length],
            shadowColor: Colors.grey,
            child: ListTile(
              title: Text(
                _list[index],
                style: TextStyle(color: Colors.black,
                ),
              ),
            ),
          );
        });
  }
}
