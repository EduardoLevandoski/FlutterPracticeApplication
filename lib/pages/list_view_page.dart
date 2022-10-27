import 'package:flutter/material.dart';

import '../utils/nav.dart';

class Dog {
  String name;
  String picture;

  Dog(this.name, this.picture);

  getPicture() => _img(picture);

  getText() => _text(name);
}

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          _iconButton(() => _onClickPop(context, "Home"), const Icon(Icons.home)),
        ],
      ),
      body: _body(),
    );
  }
}

_iconButton(Function() onPressed, icon) {
  return IconButton(
      onPressed: onPressed,
      icon: icon,
  );
}

_body() {
  List<Dog> dogs = [
    Dog("Jack Russel", "dog1.png"),
    Dog("Golden Retriever", "dog2.png"),
    Dog("Pug", "dog3.png"),
    Dog("Rottweiler", "dog4.png"),
    Dog("Border Collie", "dog5.png"),
  ];

  return GridView.builder(
    itemCount: dogs.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (context, index) {
      return Stack(
        fit: StackFit.expand,
        children: [
          dogs[index].getPicture(),
          dogs[index].getText(),
        ],
      );
    },
  );
}

_img(String img) {
  return Container(
    padding: const EdgeInsets.only(top: 45),
    child: Image.asset(
      "assets/images/" + img,
      fit: BoxFit.cover,
    ),
  );
}

_text(String text) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.black,
        ),
      ),
    ),
  );
}

_onClickPop(context, [value]){
  pop(context, value);
}

