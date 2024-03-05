  import 'package:uuid/uuid.dart';
  import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';
  final formatter = DateFormat.yMd();
const uuid = Uuid();
enum Category {
  food, travel, work, home
}
const CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.home: Icons.home

};
class Expense {
   Expense({
    required this.name,
    required this.amount,
    required this.date,
    required this.category 
    }) : id = uuid.v4();
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final Category category;
 String get formattedDate {
  return formatter.format(date);
 }
}