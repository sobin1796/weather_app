import 'package:flutter/material.dart';
import 'package:weather_app/constant/texttheme.dart';

Widget _buildDetailRow(
    String label, String imagePath, String value, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      textdesc(name: label, size: 16),
      Image.asset(
        imagePath,
        fit: BoxFit.contain,
        height: MediaQuery.of(context).size.height / 18,
        width: MediaQuery.of(context).size.width / 13,
      ),
      textdesc(name: value, size: 16),
    ],
  );
}
