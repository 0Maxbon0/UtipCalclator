import 'package:flutter/material.dart';

class BillAmountTF extends StatelessWidget {
  const BillAmountTF({
    super.key,
    required this.billAmount,
    required this.onChanged,
  });
  final String billAmount;
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.attach_money),
        labelText: 'BillAmount',
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        onChanged(value);
      },
    );
  }
}
