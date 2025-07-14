import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:expense/presentation/home/cubit/expense_cubit.dart';
import 'package:expense/presentation/home/cubit/expense_state.dart';
import 'package:expense/presentation/home/widgets/balance_card.dart';
import 'package:expense/presentation/home/widgets/budget_pie_chart.dart';
import 'package:expense/presentation/home/widgets/home_header.dart';
import 'package:expense/presentation/home/widgets/information_list_grid.dart';
import 'package:expense/presentation/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:expense/presentation/settings/settings_screen.dart';
import 'package:expense/presentation/home/widgets/profile_header.dart';
import 'package:expense/app/styles/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      const HomeContent(),
      SettingsScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: IndexedStack(index: _selectedIndex, children: _screens),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        items: [
          CurvedNavigationBarItem(child: Icon(Icons.home), label: 'Home'),
          CurvedNavigationBarItem(
            child: Icon(Icons.settings),
            label: 'Settings',
          ),
          CurvedNavigationBarItem(child: Icon(Icons.person), label: 'Profile'),
        ],
        color: Color(0xFF1976D2),
        buttonBackgroundColor: Color(0xFF1976D2),
        backgroundColor: Color(0xFFFFFFFF),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
