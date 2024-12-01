import 'package:flutter/material.dart';
Widget buildPlayerTextField({
  required String hintText,
  required TextEditingController controller,
  required String Function(String?) validator,
}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      validator: validator,
    ),
  );
}
