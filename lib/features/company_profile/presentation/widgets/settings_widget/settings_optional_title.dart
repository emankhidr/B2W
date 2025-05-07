import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget settingsOptionalTitle(
    {required IconData icon, required String title, required VoidCallback onTap}){
  return ListTile(
    leading: Icon(icon, color: Colors.purple),
    title: Text(title, style: TextStyle(color: Colors.grey, fontSize: 16)),
    trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 16),
    onTap: onTap,
  );
}