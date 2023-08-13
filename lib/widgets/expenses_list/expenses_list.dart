import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expenseList, required this.removeExpense, super.key});
  final void Function(Expense) removeExpense;
  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    //Recycler View
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(expenseList[index]),
        onDismissed: (direction) {
          removeExpense(expenseList[index]);
        },
        child: ExpenseItem(
          expense: expenseList[index],
        ),
      ),
    );
  }
}
