import 'package:flutter/material.dart';

//Future
push(BuildContext context, Widget page) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => page));

pop(BuildContext context, [var value]) => Navigator.pop(context, value);


