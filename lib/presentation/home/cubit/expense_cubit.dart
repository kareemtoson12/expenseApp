import 'package:expense/domain/models/expense_model.dart';
import 'package:expense/domain/usecase/exprense_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  final AddExpense addExpenseUseCase;
  final GetAllExpenses getAllExpensesUseCase;
  final DeleteExpense deleteExpenseUseCase;
  final UpdateExpense updateExpenseUseCase;

  ExpenseCubit({
    required this.addExpenseUseCase,
    required this.getAllExpensesUseCase,
    required this.deleteExpenseUseCase,
    required this.updateExpenseUseCase,
  }) : super(ExpenseInitial());

  Future<void> loadExpenses() async {
    emit(ExpenseLoading());
    try {
      final expenses = await getAllExpensesUseCase();
      if (expenses.isEmpty) {
        emit(ExpenseEmpty());
      } else {
        emit(ExpenseLoaded(expenses));
      }
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  Future<void> addExpense(Expense expense) async {
    await addExpenseUseCase(expense);
    await loadExpenses();
  }

  Future<void> deleteExpense(int key) async {
    await deleteExpenseUseCase(key);
    await loadExpenses();
  }

  Future<void> updateExpense(int key, Expense expense) async {
    await updateExpenseUseCase(key, expense);
    await loadExpenses();
  }
}
