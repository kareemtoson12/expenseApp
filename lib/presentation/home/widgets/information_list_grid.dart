import 'package:expense/domain/models/expense_model.dart';
import 'package:expense/presentation/home/cubit/expense_cubit.dart';
import 'package:expense/presentation/home/widgets/add_bill_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense/presentation/home/all_expenses_screen.dart';

class InformationListGrid extends StatelessWidget {
  const InformationListGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'label': 'Electricity', 'icon': 'assets/png/electricty.png'},
      {'label': 'Internet', 'icon': 'assets/png/wifi.png'},
      {'label': 'Food', 'icon': 'assets/png/food.png'},
      {'label': 'Zakat', 'icon': 'assets/png/Zakat.png'},
      {'label': 'shopping', 'icon': 'assets/png/shopping.png'},
      {'label': 'Gas', 'icon': 'assets/png/gas.png'},
      {'label': 'WaterBill', 'icon': 'assets/png/waterbill.png'},
      {'label': 'More', 'icon': 'assets/png/more.png'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Information List',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/all_expenses');
                },
                child: const Text(
                  'View',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final item = categories[index];
            return GestureDetector(
              onTap: () async {
                final controller = TextEditingController();

                final amount = await showModalBottomSheet<double>(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: AddBillBottomSheet(
                      label: item['label']!,
                      iconAsset: item['icon']!,
                      controller: controller,
                      onDone: () {
                        final value = double.tryParse(controller.text);
                        if (value != null && value > 0) {
                          Navigator.pop(context, value);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                );

                if (amount != null && amount > 0) {
                  final cubit = context.read<ExpenseCubit>();
                  final expense = Expense(
                    category: item['label']!,
                    amount: amount,

                    date: DateTime.now(),
                  );
                  await cubit.addExpense(expense);
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F7FB),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Image.asset(
                        item['icon']!,
                        width: 32,
                        height: 32,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['label']!,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
