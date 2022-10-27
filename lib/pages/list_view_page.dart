import 'package:flutter/material.dart';

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
      ),
      body: _body(),
    );
  }
}

_body() {
  List<Dog> dogs = [
    Dog("Jack Russel", "dog1.png"),
    Dog("Golden Retriever", "dog2.png"),
    Dog("Pug", "dog3.png"),
    Dog("Rottweiler", "dog4.png"),
    Dog("Border Collie", "dog5.png"),
  ];

  return ListView.builder(
    itemCount: dogs.length,
    itemExtent: 420,
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
    padding: const EdgeInsets.only(top: 65),
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
          fontSize: 45,
          color: Colors.black,
        ),
      ),
    ),
  );
}
