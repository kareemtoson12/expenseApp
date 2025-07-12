import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class BudgetPieChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final double availableBalance;

  const BudgetPieChart({
    Key? key,
    required this.dataMap,
    required this.availableBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorList = <Color>[
      Colors.purple,

      Colors.orange,

      Colors.redAccent,
      Colors.blue,
      Colors.green,
    ];

    return Column(
      children: [
        if (dataMap.length == 1 && dataMap.containsKey('Balance'))
          Column(
            children: [
              const Icon(
                Icons.account_balance_wallet,
                size: 32,
                color: Colors.black54,
              ),
              Text(
                '₹ ${availableBalance.clamp(0, double.infinity).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const Text(
                'Available Budget',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 16),
              const Text(
                'No expenses yet',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          )
        else ...[
          PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 1200),
            chartType: ChartType.ring,
            ringStrokeWidth: 32,
            chartRadius: MediaQuery.of(context).size.width * 0.48,
            colorList: colorList,
            legendOptions: const LegendOptions(showLegends: false),
            chartValuesOptions: const ChartValuesOptions(
              showChartValues: false,
            ),
            centerWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_balance_wallet,
                  size: 32,
                  color: Colors.black54,
                ),
                Text(
                  '₹ ${availableBalance.clamp(0, double.infinity).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const Text(
                  'Available Budget',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: dataMap.entries.where((entry) => entry.value > 0).map((
              entry,
            ) {
              final color =
                  colorList[dataMap.keys.toList().indexOf(entry.key) %
                      colorList.length];
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(radius: 6, backgroundColor: color),
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${entry.key} - ${entry.value.toStringAsFixed(0)}', // or show amount, not percent
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
