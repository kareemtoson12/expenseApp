import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense/presentation/home/cubit/expense_cubit.dart';
import 'package:expense/presentation/home/cubit/expense_state.dart';
import 'package:expense/domain/models/expense_model.dart';

class AllExpensesScreen extends StatelessWidget {
  const AllExpensesScreen({Key? key}) : super(key: key);

  static const Map<String, Color> categoryColors = {
    'Electricity': Color(0xFFFFF3CD),
    'Gas': Color(0xFFFFE2E2),
    'Internet': Color(0xFFE0F7FA),
    'Water': Color(0xFFFFF6E0),
    'Food': Color(0xFFE6F4EA),
    'shopping': Color(0xFFE0E0E0),
    // Add more categories/colors as needed
  };

  static const Map<String, String> categoryIcons = {
    'Electricity': 'assets/png/electricty.png',
    'Gas': 'assets/png/gas.png',
    'Internet': 'assets/png/wifi.png',
    'Water': 'assets/png/waterbill.png',
    'Food': 'assets/png/food.png',
    'shopping': 'assets/png/shopping.png',
    'zakat': 'assets/png/zakat.png',
    // Add more categories/icons as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Bill'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<ExpenseCubit, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExpenseLoaded) {
            final expenses = state.expenses;
            if (expenses.isEmpty) {
              return const Center(child: Text('No expenses found.'));
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              itemCount: expenses.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final Expense expense = expenses[index];
                final color =
                    categoryColors[expense.category] ?? const Color(0xFFF6F7FB);
                final iconAsset = categoryIcons[expense.category];
                return Dismissible(
                  key: ValueKey(expense.key),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    color: Colors.redAccent,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  onDismissed: (_) {
                    context.read<ExpenseCubit>().deleteExpense(expense.key);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        if (iconAsset != null)
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Image.asset(
                                iconAsset,
                                width: 24,
                                height: 24,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        if (iconAsset != null) const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            expense.category,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '₹${expense.amount.toStringAsFixed(0)} /month',
                            style: TextStyle(
                              color: expense.amount > 0
                                  ? Colors.red
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is ExpenseEmpty) {
            return const Center(child: Text('No expenses found.'));
          } else if (state is ExpenseError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
