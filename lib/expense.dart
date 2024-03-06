import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _userExpense = [
    Expense(
        name: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        name: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.travel)
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _userExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _userExpense.indexOf(expense);
    setState(() {
      _userExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        duration: const Duration(seconds: 2),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
            textColor: Theme.of(context).colorScheme.error,
            label: 'Undo',
            onPressed: () {
              setState(() {
                _userExpense.insert(expenseIndex, expense);
              });
            })));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Expense found. Start adding some!'),
    );

    if (_userExpense.isNotEmpty) {
      mainContent =
          ExpensesList(expenses: _userExpense, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Expense Tracker',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: Icon(Icons.add, size: 30, color: Colors.white))
        ],
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text('the chart'),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
