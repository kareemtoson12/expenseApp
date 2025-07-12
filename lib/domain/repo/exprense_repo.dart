import 'package:expense/domain/models/expense_model.dart';

abstract class ExpenseRepository {
  Future<void> addExpense(Expense expense);
  Future<List<Expense>> getAllExpenses();
  Future<void> deleteExpense(int key);
  Future<void> updateExpense(int key, Expense expense);
  Future<void> clearAllExpenses();
}
