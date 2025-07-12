import 'package:expense/presentation/home/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:expense/app/styles/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final VoidCallback? onNotificationPressed;

  const HomeHeader({
    Key? key,
    required this.userName,
    this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Hello', style: AppTextStyles.onboardingTitle),
                  Text('  $userName', style: const TextStyle(fontSize: 20)),
                ],
              ),
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Color(0xFfFBBC05),
                  size: 40,
                ),
                onPressed: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirm'),
                      content: const Text(
                        'Are you sure you want to delete all expenses?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );

                  if (confirmed == true) {
                    context.read<ExpenseCubit>().clearAllExpenses();
                  }
                },
              ),
            ],
          ),
        ),

        Text(
          'Your available balance',
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Color(0xFF8F92A1),
          ),
        ),
      ],
    );
  }
}
