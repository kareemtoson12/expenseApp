import 'package:expense/data/local_db/Expense_local_db.dart';
import 'package:expense/domain/models/expense_model.dart';
import 'package:expense/domain/repo/exprense_repo.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDataSource localDataSource;

  ExpenseRepositoryImpl(this.localDataSource);

  @override
  Future<void> addExpense(Expense expense) =>
      localDataSource.addExpense(expense);

  @override
  Future<List<Expense>> getAllExpenses() => localDataSource.getAllExpenses();

  @override
  Future<void> deleteExpense(int key) => localDataSource.deleteExpense(key);

  @override
  Future<void> updateExpense(int key, Expense expense) =>
      localDataSource.updateExpense(key, expense);

  @override
  Future<void> clearAllExpenses() => localDataSource.clearAllExpenses();
}
