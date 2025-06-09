import 'package:flutter/material.dart';

class Tip_Row extends StatelessWidget {
  const Tip_Row({super.key, required this.theme, required double totalTip})
    : _totalTip = totalTip;

  final ThemeData theme;
  final double _totalTip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Tip", style: theme.textTheme.titleMedium),
        Text(
          "${_totalTip.toStringAsFixed(2)}\$",
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
