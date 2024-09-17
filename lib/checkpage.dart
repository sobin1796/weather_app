import 'package:flutter/material.dart';
import 'package:weather_app/constant/texttheme.dart';

class Checkpage extends StatefulWidget {
  const Checkpage({super.key});

  @override
  State<Checkpage> createState() => _CheckpageState();
}

class _CheckpageState extends State<Checkpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: subtext(name: 'check page'),
    );
  }
}
