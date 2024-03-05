import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';
  import 'package:expense_tracker/models/expense.dart';
  final formatter = DateFormat.yMd();
class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;
    final pickedDate = await showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now).then((value){});
  setState((){
    _selectedDate = pickedDate ;
  });
  }
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Title'),
            
            )
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    
                    label: Text('Amount'),
                  
                  )
                ),
              ),
              const SizedBox(width:16),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
              
                 Text( _selectedDate == null ? 'No Date Selected' : formatter.format(_selectedDate!)),
                IconButton(onPressed: _presentDatePicker, icon: Icon(Icons.calendar_month))

              ],))
            ],
          ),
          Row(

            children: [
              DropdownButton(
                items: Category.values.map(
                  (category) => DropdownMenuItem(
                    child: Text(category.name.toString())), 
                    
                  ).toList(),
                  onChanged: (value){
                    
                  },

                ),
                ], )  ,            ],
              ),
              const Spacer(),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }
             , child: const Text('Cancel')),
             
              ElevatedButton(onPressed: (){
                final amount = double.tryParse(_amountController.text);
                if(amount == null || _titleController.text.isEmpty){
                  return;
                }
              }
                , child: const Text('Save Expense')),
              
            ]
          )
    ]));  }
}