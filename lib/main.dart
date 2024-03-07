import 'package:flutter/material.dart';
import 'package:expense_tracker/expense.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 237, 224, 212),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color.fromARGB(255, 139, 107, 81),
              secondary: Color.fromARGB(255, 255, 226, 192),
            )),
    home: const Expenses(),
  ));
}
