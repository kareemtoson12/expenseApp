import 'package:expense/app/styles/feature_pill_styles.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final double percent;
  final String percentLabel;
  final String imageAsset;

  const BalanceCard({
    Key? key,
    required this.balance,
    required this.percent,
    required this.percentLabel,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double cardPadding = size.width * 0.06; // Responsive padding
    final double fontSize =
        size.width * 0.08; // Responsive font size for balance
    final double imageSize = size.width * 0.22; // Responsive image size
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(cardPadding),
          decoration: BoxDecoration(
            gradient: FeaturePillStyles.pillGradient,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.04),
              Text(
                '\$${balance.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(
            imageAsset,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
