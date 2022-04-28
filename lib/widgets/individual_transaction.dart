import 'package:flutter/material.dart';
import 'package:mad_lab_project/model/transactions.dart';
import 'package:intl/intl.dart';

class IndividualTransaction extends StatelessWidget {
  final List<List<dynamic>> transactions;
  // final Function deleteTx;
  const IndividualTransaction({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: transactions[index][2] == '-'
                  ? Colors.redAccent.shade700
                  : Colors.green.shade800,
            ),
          ),
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                transactions[index][3] == 'food'
                    ? const Icon(Icons.restaurant)
                    : transactions[index][3] == 'fuel'
                        ? const Icon(Icons.bike_scooter)
                        : transactions[index][3] == 'salary'
                            ? const Icon(Icons.money)
                            : const Icon(Icons.account_balance_wallet),
              ],
            ),
            title: Text(
              transactions[index][0]!,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(transactions[index][4]!),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                transactions[index][2] == '-'
                    ? Text(
                        '-\$' + transactions[index][1].toString(),
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    : Text(
                        '+\$' + transactions[index][1].toString(),
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold,fontSize: 16),
                      ),
              ],
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}
