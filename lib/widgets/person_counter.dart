import 'package:flutter/material.dart';

class PersonCount extends StatelessWidget {
  const PersonCount({
    super.key,
    required this.theme,
    required int personCount,
    required this.onDecrement,
    required this.onIcrement,
  }) : _personCount = personCount;

  final ThemeData theme;
  final int _personCount;
  final VoidCallback onDecrement;
  final VoidCallback onIcrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text('Split', style: theme.textTheme.titleMedium),
        Row(
          children: [
            IconButton(
              color: theme.colorScheme.primary,
              onPressed: onDecrement,
              icon: Icon(Icons.remove),
            ),
            Text('$_personCount', style: theme.textTheme.titleMedium),
            IconButton(
              color: theme.colorScheme.primary,
              onPressed: onIcrement,
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
