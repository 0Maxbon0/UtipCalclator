import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.style,
    required this.total,
    required this.theme,
  });

  final TextStyle style;
  final double total;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text('Total to paid per person', style: style),
            Text(
              '${total.toStringAsFixed(2)}\$',
              style: style.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: theme.textTheme.displaySmall?.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
