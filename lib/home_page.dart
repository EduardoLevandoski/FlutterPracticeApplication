import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project01/pages/hello_page1.dart';
import 'package:project01/pages/hello_page2.dart';
import 'package:project01/pages/list_view_page.dart';
import 'package:project01/utils/nav.dart';
import 'package:project01/widgets/default_button.dart';
import 'package:project01/widgets/drawer_list.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onClickFab(),
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      drawer: const DrawerList(),
    );
  }
}

_onClickFab() {
  if (kDebugMode) {
    print("Add");
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
        _buttons(),
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

_buttons() {
  return Builder(builder: (context) {
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
          children: [
            DefaultButton("Snack", onPressed: () => _onClickSnack(context)),
            DefaultButton("Dialog", onPressed: () => _onClickDialog(context)),
            DefaultButton("Toast", onPressed: () => _onClickToast(context)),
          ],
        ),
      ],
    );
  });
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

_onClickNavigator(BuildContext context, Widget page) async {
  var s = await push(context, page);
  if (kDebugMode) {
    print(">> $s");
  }
}

_onClickSnack(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        "Snack",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      action: SnackBarAction(
        label: "Ok",
        textColor: Colors.yellow,
        onPressed: () {
          if (kDebugMode) {
            print("Ok");
          }
        },
      ),
    ),
  );
}

_onClickDialog(context) {
  showDialog(context: context, builder: (context) => _alertDialog(context), barrierDismissible: false);
}

_alertDialog(context) {
  return WillPopScope(
    onWillPop: () async => false,
    child: AlertDialog(
      title: const Text("Dialog alert"),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Ok")),
      ],
    ),
  );
}

_onClickToast(context) {
  Fluttertoast.showToast(
    msg: "This is Center Short Toast",
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
