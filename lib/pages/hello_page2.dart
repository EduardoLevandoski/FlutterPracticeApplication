import 'package:flutter/material.dart';

import '../home_page.dart';
import '../utils/nav.dart';
import '../widgets/default_button.dart';

class HelloPage2 extends StatelessWidget {
  const HelloPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2"),
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
      child: DefaultButton("Home", onPressed: () => _onClickPop(context, "Page 2")),
    ),
  );
}

_onClickPop(context, [value]){
  pop(context, value);
}
