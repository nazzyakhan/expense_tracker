import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
class Expenses extends StatefulWidget {
  const Expenses({super.key});
  State<Expenses 
  > createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _userExpense = [
    Expense(
      name: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work
    ),
    Expense(
      name: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.travel 
    )
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker', style: TextStyle(color: Colors.white),),
        actions: [IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add, size: 30, color: Colors.white))],
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 0,
             
      ),
      body: Column(children: [
        Text('the chart'),
        Expanded(child: ExpensesList(expenses: _userExpense)),
      ],)

    );
  }
}