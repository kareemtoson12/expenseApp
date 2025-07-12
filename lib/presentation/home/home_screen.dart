import 'package:expense/presentation/home/cubit/expense_cubit.dart';
import 'package:expense/presentation/home/cubit/expense_state.dart';
import 'package:expense/presentation/home/widgets/balance_card.dart';
import 'package:expense/presentation/home/widgets/budget_pie_chart.dart';

import 'package:expense/presentation/home/widgets/home_header.dart';
import 'package:expense/presentation/home/widgets/information_list_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense/presentation/home/widgets/custom_curved_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ExpenseCubit, ExpenseState>(
            builder: (context, state) {
              final cubit = context.read<ExpenseCubit>();
              final income = cubit.incomeFromPrefs;

              double spent = 0;
              final List<String> allCategories = [
                'Food',
                'Internet',
                'Gas',
                'Shopping',
                'Home',
                'Water',
                'Electricity',
                'Uber',
                'Zakat',
                'Cashback',
                'Wifi',
                'Person',
                'More', // add all your categories here
              ];
              final Map<String, double> dataMap = {
                for (var cat in allCategories) cat: 0.0,
              };

              if (state is ExpenseLoaded) {
                final expenses = state.expenses;

                if (expenses.isEmpty) {
                  // Only show balance if no expenses
                  dataMap['Balance'] = income;
                } else {
                  for (final e in expenses) {
                    spent += e.amount;
                    dataMap.update(
                      e.category,
                      (val) => val + e.amount,
                      ifAbsent: () => e.amount,
                    );
                  }
                  // Update Balance after subtracting expenses
                  dataMap['Balance'] = income - spent;
                }
              } else {
                // If not loaded, show only balance
                dataMap['Balance'] = income;
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    HomeHeader(
                      userName: cubit.userNameFromPrefs,
                      onNotificationPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    BalanceCard(
                      balance: income,
                      percent: 2.70,
                      percentLabel: 'Today',
                      imageAsset: 'assets/png/monyWhiteBackGround.png',
                    ),
                    const SizedBox(height: 24),
                    BudgetPieChart(
                      dataMap: dataMap,
                      availableBalance: dataMap['Balance'] ?? 0,
                    ),
                    const SizedBox(height: 15),
                    const InformationListGrid(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomCurvedNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Handle navigation here if needed
        },
      ),
    );
  }
}
