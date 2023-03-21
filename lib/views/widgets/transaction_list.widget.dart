import 'package:flutter/material.dart';
import 'package:personal_expenses/views/widgets/transaction_card.widget.dart';

import '../../models/transaction.model.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({Key? key, required this.transactions, required this.deleteTX}) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTX;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      // child: ListView(
      //   children: transactions.map((tx) => TransactionCard(tx: tx)).toList(),
      // ),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionCard(tx: transactions[index], deleteTX: deleteTX,);
        },
        itemCount: transactions.length,
      ),
    );
  }
}
