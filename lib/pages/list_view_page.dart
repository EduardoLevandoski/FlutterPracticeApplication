import 'package:flutter/material.dart';

import '../utils/nav.dart';

class Dog {
  String name;
  String picture;

  Dog(this.name, this.picture);

  getPicture() => _img(picture);

  getText() => _text(name);
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  late bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          _iconButton(() {
            setState(() {
              _gridView = false;
            });
          }, const Icon(Icons.view_list)),
          _iconButton(() {
            setState(() {
              _gridView = true;
            });
          }, const Icon(Icons.grid_view)),
        ],
      ),
      body: _body(_gridView),
    );
  }
}

_iconButton(Function() onPressed, icon) {
  return IconButton(
      onPressed: onPressed,
      icon: icon,
  );
}

_body(_gridView) {
  List<Dog> dogs = [
    Dog("Jack Russel", "dog1.png"),
    Dog("Golden Retriever", "dog2.png"),
    Dog("Pug", "dog3.png"),
    Dog("Rottweiler", "dog4.png"),
    Dog("Border Collie", "dog5.png"),
  ];

  if(_gridView){
    return GridView.builder(
      itemCount: dogs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return _itemView(dogs, index);
      },
    );
  } else {
    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 420,
      itemBuilder: (context, index) {
        return _itemView(dogs, index);
      },
    );
  }
}

Stack _itemView(List<Dog> dogs, int index) {
  return Stack(
    fit: StackFit.expand,
    children: [
      dogs[index].getPicture(),
      dogs[index].getText(),
    ],
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
