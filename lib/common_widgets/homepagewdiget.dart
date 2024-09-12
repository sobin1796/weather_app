import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors_name.dart';
import 'package:weather_app/constant/texttheme.dart';

Widget buildDetailRow({
  required BuildContext context,
  String? label,
  String? imagePath,
  String? value,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      textdesc(name: label, size: 16),
      Image.asset(
        imagePath ?? '',
        fit: BoxFit.contain,
        height: MediaQuery.of(context).size.height / 18,
        width: MediaQuery.of(context).size.width / 13,
      ),
      textdesc(name: value, size: 16),
    ],
  );
}

Widget buildWeatherElement(
    {String? imagePath, String? value, String? label, required context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imagePath ?? '',
        fit: BoxFit.contain,
        height: MediaQuery.of(context).size.height / 18,
        width: MediaQuery.of(context).size.width / 13,
      ),
      titletext(name: value, size: 18),
      textdesc(name: label, size: 12),
    ],
  );
}

Widget daydetails(
    {required BuildContext context,
    String? image,
    String? time,
    String? temp}) {
  return Container(
    height: MediaQuery.of(context).size.height / 7,
    width: MediaQuery.of(context).size.width / 3.75,
    decoration: const BoxDecoration(
      color: boxtile_color,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          time ?? 'null',
          style: const TextStyle(color: title_color, fontSize: 14),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(
                image ?? '',
              ),
              fit: BoxFit.contain,
            ),
          ),
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width / 10,
        ),
        Text(
          temp ?? '',
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 191, 0), fontSize: 14),
        ),
      ],
    ),
  );
}
