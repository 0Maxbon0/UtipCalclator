import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/providers/ThemeProvider.dart';
import 'package:utip/providers/TipCalculatorModel.dart';
import 'package:utip/widgets/BillAmount.dart';
import 'package:utip/widgets/Tip_Slider.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tipRow.dart';
import 'package:utip/widgets/toggle_theme_button.dart';
import 'package:utip/widgets/totalPerPerson.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TipCalculatorModel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'UTip',
      theme: themeProvider.currentTheme,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final model = Provider.of<TipCalculatorModel>(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Utip'), actions: [ToggleThemeButton()]),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(
            style: style,
            total: model.totalPerPerson,
            theme: theme,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  BillAmountTF(
                    billAmount: model.billTotal.toString(),
                    onChanged: (value) {
                      model.updateBillTotal(double.parse(value));
                    },
                  ),
                  PersonCount(
                    theme: theme,
                    personCount: model.personCount,
                    onDecrement: () {
                      if (model.personCount > 1) {
                        model.updatePersonCount(model.personCount - 1);
                      }
                    },
                    onIcrement: () {
                      model.updatePersonCount(model.personCount + 1);
                    },
                  ),
                  Tip_Row(
                    theme: theme,
                    totalTip: model.billTotal * model.tipPercentage,
                  ),
                  Text("${(model.tipPercentage * 100).round()}%"),
                  TipSlider(
                    tipPercentage: model.tipPercentage,
                    onChanged: (double value) {
                      model.updateTipPercentage(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
