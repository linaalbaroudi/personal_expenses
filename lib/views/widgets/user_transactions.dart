import 'package:flutter/material.dart';
import 'package:personal_expenses/views/widgets/transaction_list.widget.dart';
import '../../models/transaction.model.dart';
import 'add_transaction.widget.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key, required this.deleteTX}) : super(key: key);

  final Function deleteTX;

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        id: "01",
        title: "nail salon",
        amount: 300.1111,
        date: DateTime.now(),
    ),
    Transaction(
        id: "02",
        title: "hunger station order",
        amount: 59.3245,
        date: DateTime.now(),

    ),
    Transaction(
      id: "03",
      title: "Supermarket",
      amount: 530,
      date: DateTime.now(),
    ),
    Transaction(
      id: "04",
      title: "GYM subscription",
      amount: 3400,
      date: DateTime.now(),

    ),
  ];

  void _addTX(String title, double amount) {
    final newTX = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
    );
    setState(() {
      _transactions.add(newTX);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTransaction(addTX: _addTX),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 4),
          child: Text(
            "Transactions:",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        TransactionsList(transactions: _transactions, deleteTX: widget.deleteTX),
      ],
    );
  }
}
