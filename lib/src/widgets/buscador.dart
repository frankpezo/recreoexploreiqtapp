import 'package:flutter/material.dart';

Widget buildSearchTextField() {
  return TextField(
    // onChanged: ((value) => updateList(value)),
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      filled: true,
      fillColor: Color.fromARGB(255, 234, 233, 233),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none,
      ),
      hintText: 'Buscar recreo turístico... ',
      hintStyle: TextStyle(fontSize: 14),
      suffixIcon: Icon(Icons.search),
      suffixIconColor: Color.fromARGB(255, 19, 19, 19),
      contentPadding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 20.0,
      ), // Ajusta según sea necesario
    ),
  );
}
