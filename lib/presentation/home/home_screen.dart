import 'package:expense/app/styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPill = 0;
  int _selectedNav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
             
            ],
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
