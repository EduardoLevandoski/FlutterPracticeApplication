import 'package:flutter/material.dart';

import 'list_view_page.dart';

class DogPage extends StatelessWidget {
  const DogPage({Key? key, required this.dog}) : super(key: key);

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: _img(dog.picture),
    );
  }
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
