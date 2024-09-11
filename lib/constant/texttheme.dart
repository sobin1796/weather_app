import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors_name.dart';

Widget titletext({
  String? name,
  double? size,
}) {
  return Text(
    name ?? 'no text',
    style: TextStyle(
        color: title_color, fontSize: size, fontWeight: FontWeight.bold),
  );
}

Widget subtext({
  String? name,
  double? size,
}) {
  return Text(
    name ?? 'no text',
    style: TextStyle(
        color: sub_title_color, fontSize: size, fontWeight: FontWeight.bold),
  );
}
