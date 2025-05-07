import 'package:flutter/material.dart';

InputBorder border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: Color(0xFFE3E3E5), width: 1),
);

TextFormField formField({
  required bool isHidden,
  required String? Function(String?) validate,
  required TextEditingController mycontroller,
  required VoidCallback toggleVisibility,
}) {
  return TextFormField(
    validator: validate,
    controller: mycontroller,
    keyboardType: TextInputType.visiblePassword,
    obscureText: isHidden,
    onChanged: (value) {},
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      suffixIcon: IconButton(
        onPressed: toggleVisibility,
        icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
      ),
    ),
  );
}
