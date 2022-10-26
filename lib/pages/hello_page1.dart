import 'package:flutter/material.dart';

import '../home_page.dart';
import '../widgets/default_button.dart';

class HelloPage1 extends StatelessWidget {
  const HelloPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: _body(context),
    );
  }
}

_body(context) {
  return Container(
    color: Colors.white24,
    child: Center(
      child: DefaultButton("Home", onPressed: () => _onClickPop(context)),
    ),
  );
}

_onClickPop(context){
  Navigator.pop(context, "Page 1");
}

