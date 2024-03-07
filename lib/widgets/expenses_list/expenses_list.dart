import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  @override
  Widget build(BuildContext context) {
    return widget.expenses.isEmpty
        ? const Center(child: Text("No expenses found. Start adding some!"))
        : ListView.builder(
            itemCount: widget.expenses.length,
            itemBuilder: (context, index) {
              print("building $index");
              return Dismissible(
                onDismissed: (direction) {
                  print("dismissing $index");
                  setState(
                      () => widget.expenses.remove(widget.expenses[index]));
                },
                key: ValueKey(widget.expenses[index]),
                child: ExpenseItem(expense: widget.expenses[index]),
              );
            },
          );
  }
}
