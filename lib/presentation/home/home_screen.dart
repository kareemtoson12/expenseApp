import 'package:expense/app/styles/text_styles.dart';

import 'package:flutter/material.dart';

import 'widgets/custom_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/home_header.dart';
import 'widgets/balance_card.dart';
import 'widgets/budget_pie_chart.dart';
import 'widgets/information_list_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNav = 0;
  String _userName = '';
  double _balance = 0.0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('name') ?? '';
      _balance =
          double.tryParse(prefs.getString('monthly_income') ?? '') ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Header
                HomeHeader(
                  userName: _userName,
                  onNotificationPressed: () {
                    // Handle notification tap
                  },
                ),
                const SizedBox(height: 20),
                BalanceCard(
                  balance: _balance,
                  percent: 2.70,
                  percentLabel: 'Today',
                  imageAsset: 'assets/png/monyWhiteBackGround.png',
                ),
                const SizedBox(height: 24),
                BudgetPieChart(
                  dataMap: {
                    'Balance': _balance,
                    'Dining & Food': 150,
                    'Internet': 2500,
                    'Shopping': 200,
                    'Others': 10000,
                  },
                  totalBudget: 1800.0,
                ),
                const SizedBox(height: 15),
                InformationListGrid(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedNav,
        onTap: (i) => setState(() => _selectedNav = i),
        onFabTap: () {
          // Handle FAB action
        },
      ),
    );
  }
}
