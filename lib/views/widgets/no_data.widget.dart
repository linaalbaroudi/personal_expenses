import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 250,
            width: double.infinity,
            padding: EdgeInsets.all(24),
            child: Image.asset("assets/images/waiting.png"),
        ),
        Text("No Transactions Yet!", style: Theme.of(context).textTheme.headlineMedium,)
      ],
    );
  }
}
