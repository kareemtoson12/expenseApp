import 'package:expense/domain/models/expense_model.dart';
import 'package:hive/hive.dart';

class ExpenseLocalDataSource {
  static const String boxName = 'expenses';

  Future<void> addExpense(Expense expense) async {
    final box = await Hive.openBox<Expense>(boxName);
    await box.add(expense);
  }

  Future<List<Expense>> getAllExpenses() async {
    final box = await Hive.openBox<Expense>(boxName);
    return box.values.toList();
  }

  Future<void> deleteExpense(int key) async {
    final box = await Hive.openBox<Expense>(boxName);
    await box.delete(key);
  }

  Future<void> updateExpense(int key, Expense expense) async {
    final box = await Hive.openBox<Expense>(boxName);
    await box.put(key, expense);
  }
}
