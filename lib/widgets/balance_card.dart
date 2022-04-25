import 'package:flutter/material.dart';

class AccountsCard extends StatelessWidget {
  const AccountsCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200.0,
          width: MediaQuery.of(context).size.width - 10,
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Wallet',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  'Income: \$1000.00',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Expense: \$500.00',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
