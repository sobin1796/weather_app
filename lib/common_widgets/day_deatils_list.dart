import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors_name.dart';

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
              color: const Color.fromARGB(255, 255, 191, 0), fontSize: 14),
        ),
      ],
    ),
  );
}
