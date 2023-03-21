import 'package:flutter/material.dart';
import 'package:personal_expenses/views/widgets/no_data.widget.dart';
import './views/widgets/add_transaction.widget.dart';
import './views/widgets/transaction_list.widget.dart';

//import 'package:personal_expenses/views/widgets/user_transactions.dart';
import 'app_theme.dart';
import 'models/transaction.model.dart';
import 'views/widgets/chart.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: AppTheme.light(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //     id: "00",
    //     title: "Supermarket",
    //     amount: 600.65,
    //     date: DateTime.now()
    // ),
    // Transaction(
    //   id: "01",
    //   title: "nail salon",
    //   amount: 300.5123,
    //   date: DateTime.now().subtract(Duration(days: 1))
    // ),
    // Transaction(
    //   id: "02",
    //   title: "hunger station order",
    //   amount: 59.32,
    //   date: DateTime.now().subtract(Duration(days: 2))
    // ),
    // Transaction(
    //     id: "03",
    //     title: "Hat",
    //     amount: 60.5,
    //     date: DateTime.now().subtract(Duration(days: 3))
    // ),
    // Transaction(
    //     id: "04",
    //     title: "Shoes",
    //     amount: 470.95,
    //     date: DateTime.now().subtract(Duration(days: 7))
    // ),
  ];

  List<Transaction> get _latestTransactions{
    return _transactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTX(String title, double amount, DateTime date) {
    final newTX = Transaction(
      title: title,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );
    setState(() {
      _transactions.add(newTX);
    });
  }

  void _showAddTX(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddTransaction(addTX: _addTX);
        });
  }

  void _removeTX(String id){
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: [
          IconButton(
              onPressed: () => _showAddTX(context),
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 4),
                  child: Text(
                    "Weekly Summary:",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                TransactionsChart(latestTransactions: _latestTransactions),
                //UserTransactions(),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 4),
                  child: Text(
                    "Transactions:",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                _transactions.isEmpty
                    ? NoData()
                    : TransactionsList(transactions: _transactions, deleteTX: _removeTX),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTX(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
