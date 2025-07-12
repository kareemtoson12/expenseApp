import 'package:expense/domain/models/expense_model.dart';
import 'package:expense/domain/usecase/exprense_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  final AddExpense addExpenseUseCase;
  final GetAllExpenses getAllExpensesUseCase;
  final DeleteExpense deleteExpenseUseCase;
  final UpdateExpense updateExpenseUseCase;
  final ClearAllExpenses clearAllExpensesUseCase;

  ExpenseCubit({
    required this.clearAllExpensesUseCase,
    required this.addExpenseUseCase,
    required this.getAllExpensesUseCase,
    required this.deleteExpenseUseCase,
    required this.updateExpenseUseCase,
  }) : super(ExpenseInitial());

  // بيانات المستخدم
  String userNameFromPrefs = '';
  double incomeFromPrefs = 0.0;

  /* -------------------------------------------------------------------- */
  /*                         public API                                    */
  /* -------------------------------------------------------------------- */

  /// يُستدعى مرّة واحدة بعد إنشاء الكيوبت
  Future<void> init() async {
    await _loadUserPrefs();
    await loadExpenses(); // يستدعي emit داخليًا
  }

  Future<void> addExpense(Expense expense) async {
    await addExpenseUseCase(expense);
    await loadExpenses(); // يعيد البناء تلقائيًا
  }

  Future<void> deleteExpense(int key) async {
    await deleteExpenseUseCase(key);
    await loadExpenses();
  }

  Future<void> updateExpense(int key, Expense expense) async {
    await updateExpenseUseCase(key, expense);
    await loadExpenses();
  }

  Future<void> clearAllExpenses() async {
    await clearAllExpensesUseCase();
    await loadExpenses();
  }

  /* -------------------------------------------------------------------- */
  /*                         internal helpers                              */
  /* -------------------------------------------------------------------- */

  Future<void> _loadUserPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    userNameFromPrefs = prefs.getString('name') ?? '';
    final incomeStr = prefs.getString('monthly_income') ?? '0';
    incomeFromPrefs = double.tryParse(incomeStr) ?? 0.0;
  }

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
}
