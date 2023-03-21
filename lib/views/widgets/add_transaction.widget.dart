import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  //const AddTransaction({Key? key}) : super(key: key);
  const AddTransaction({Key? key, required this.addTX}) : super(key: key);

  final Function addTX;

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _pickDate(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime.now(),
    ).then((value) {
      if(value == null) return;
      setState(() {
        _selectedDate = value;
      });
    });
  }

  void _submitTX() {
    final String title = _titleController.text;
    final double amount = double.parse(_amountController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTX(
      title,
      amount,
      _selectedDate
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Text(
                "Add Transaction",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  label: Text('Title:'),
                ),
                onSubmitted: (_) => _submitTX(), //(_)indicates a val must be passed but not used
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                  label: Text('Amount:'),
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitTX(), //(_)indicates a val must be passed but not used
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    strokeAlign: Theme.of(context).inputDecorationTheme.border!.borderSide.strokeAlign,
                    width: Theme.of(context).inputDecorationTheme.border!.borderSide.width,
                    style: Theme.of(context).inputDecorationTheme.border!.borderSide.style,
                    color: Theme.of(context).inputDecorationTheme.border!.borderSide.color.withOpacity(0.4),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: _selectedDate == null
                          ? Text("Select Date",
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                          : Text(
                        DateFormat('d-M-y').format(_selectedDate!),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    IconButton(
                      onPressed: _pickDate,
                      icon: const Icon(Icons.calendar_month),
                      color: _selectedDate == null ? Theme.of(context).textTheme.labelMedium!.color : Theme.of(context).inputDecorationTheme.focusColor,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: _submitTX,
                child: const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text('Add Transaction'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
