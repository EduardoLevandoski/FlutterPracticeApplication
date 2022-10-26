import 'package:flutter/material.dart';

//Future
push(BuildContext context, Widget page) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => page));

pop(BuildContext context, String text) => Navigator.pop(context, text);
