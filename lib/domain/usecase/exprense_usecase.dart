import 'package:expense/domain/models/expense_model.dart';
import 'package:expense/domain/repo/exprense_repo.dart';

class AddExpense {
  final ExpenseRepository repository;
  AddExpense(this.repository);

  Future<void> call(Expense expense) => repository.addExpense(expense);
}

class GetAllExpenses {
  final ExpenseRepository repository;
  GetAllExpenses(this.repository);

  Future<List<Expense>> call() => repository.getAllExpenses();
}

class DeleteExpense {
  final ExpenseRepository repository;
  DeleteExpense(this.repository);

  Future<void> call(int key) => repository.deleteExpense(key);
}

class UpdateExpense {
  final ExpenseRepository repository;
  UpdateExpense(this.repository);

  Future<void> call(int key, Expense expense) =>
      repository.updateExpense(key, expense);
}

class ClearAllExpenses {
  final ExpenseRepository repository;
  ClearAllExpenses(this.repository);

  Future<void> call() => repository.clearAllExpenses();
}
