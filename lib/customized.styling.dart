import 'package:flutter/material.dart';

Widget buildInfoRow(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 20),
      Text(
        value,
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 20),
    ],
  );
}

Widget buildEditRow(String label, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
      ),
      const SizedBox(height: 6),
    ],
  );
}
