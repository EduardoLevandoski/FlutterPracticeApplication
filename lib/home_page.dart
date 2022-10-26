import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project01/pages/list_view_page.dart';
import 'package:project01/pages/hello_page1.dart';
import 'package:project01/pages/hello_page2.dart';
import 'package:project01/utils/nav.dart';
import 'package:project01/widgets/default_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: _body(context),
    );
  }
}

_body(context) {
  Size size = MediaQuery.of(context).size;

  return Container(
    color: Colors.white24,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _text("Application"),
        _pageView(size),
        _buttons(context),
      ],
    ),
  );
}

_pageView(Size size) {
  return Container(
    margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
    height: size.height / 3,
    child: PageView(
      children: [
        _img("dog1.png"),
        _img("dog2.png"),
        _img("dog3.png"),
        _img("dog4.png"),
        _img("dog5.png"),
      ],
    ),
  );
}

_buttons(context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DefaultButton("ListView", onPressed: () => _onClickNavigator(context, const ListViewPage())),
          DefaultButton("Page 1", onPressed: () => _onClickNavigator(context, const HelloPage1())),
          DefaultButton("Page 2", onPressed: () => _onClickNavigator(context, const HelloPage2())),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          DefaultButton("Snack", onPressed: _onClickSnack),
          DefaultButton("Dialog", onPressed: _onClickDialog),
          DefaultButton("Toast", onPressed: _onClickToast),
        ],
      ),
    ],
  );
}

_onClickNavigator(BuildContext context, Widget page) async {
  var s = await push(context, page);
  if (kDebugMode) {
    print(">> $s");
  }
}

_img(String img) {
  return Image.asset(
    "assets/images/" + img,
    fit: BoxFit.cover,
  );
}

_text(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 45,
      color: Colors.black,
    ),
  );
}

_onClickSnack() {}

_onClickDialog() {}

_onClickToast() {}
