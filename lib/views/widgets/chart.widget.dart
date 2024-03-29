import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/views/widgets/chart_bar.widget.dart';
import '../../models/transaction.model.dart';

class TransactionsChart extends StatelessWidget {
  TransactionsChart({Key? key, required this.latestTransactions})
      : super(key: key);

  final List<Transaction> latestTransactions;

  double get weekSpending{
    return groupedTXValues.fold(0.0, (sum, element){
      return sum + (element['amount'] as double) ;
    });
  }

  List<Map<String, Object>> get groupedTXValues {
    return List.generate(7, (index) {
      //find the days in the past week
      final day = DateTime.now().subtract(Duration(days: index));

      //find the total amount of spending in each day in the past week
      double totalAmount = 0;
      for (Transaction tx in latestTransactions) {
        if (tx.date.day == day.day &&
            tx.date.month == day.month &&
            tx.date.year == day.year) {
          totalAmount += tx.amount;
        }
      }

      return {'day': DateFormat.E().format(day), 'amount': totalAmount};
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTXValues.map((element) => ChartBar(
                  day: element['day'] as String,
                  amount: element['amount'] as double,
            ratio: weekSpending <= 0 ? 0.0 : (element['amount'] as double)/weekSpending,
          ),
          ).toList(),
        ),
      ),
    );
  }
}
