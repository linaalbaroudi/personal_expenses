import 'package:flutter/material.dart';
import 'package:personal_expenses/utils/palette.dart';
import '../../models/transaction.model.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key, required this.tx, required this.deleteTX})
      : super(key: key);

  final Transaction tx;
  final Function deleteTX;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Palette.white,
        //maxRadius: 30,
        radius: 30,
        child: FittedBox(
          child: Text(
            "\$${tx.amount.toStringAsFixed(0)}", // Round to 2 decimal places
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(
        tx.title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(DateFormat('d-M-y').format(tx.date)),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => deleteTX(tx.id),
        color: Theme.of(context).focusColor,
      ),
    ));
  }
}

//Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(right: 8),
//                   child: const Icon(
//                       Icons.monetization_on,
//                     size: 35,
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                         tx.title,
//                       style: Theme.of(context).textTheme.bodyLarge,
//                     ),
//                     Text(DateFormat('d-M-y').format(tx.date)),
//                   ],
//                 ),
//               ],
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Palette.orange,
//                   width: 2
//                 ),
//               ),
//               padding: const EdgeInsets.only(bottom: 4, top: 8, left: 8, right: 8),
//               child: Text(
//                 "\$${tx.amount.toStringAsFixed(2)}", // Round to 2 decimal places
//                 style: Theme.of(context).textTheme.displaySmall,
//               ),
//             ),
//           ],
//         ),
//       ),
