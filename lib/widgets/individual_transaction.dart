import 'package:flutter/material.dart';
import 'package:mad_lab_project/model/transactions.dart';
import 'package:intl/intl.dart';

class IndividualTransaction extends StatelessWidget {
  final List<Transaction> transactions;
  // final Function deleteTx;
  const IndividualTransaction({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          // color: transactions[index].isExpense
          //     ? Colors.redAccent.shade700
          //     : Colors.green.shade800,
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: transactions[index].isExpense
                      ? Colors.redAccent.shade700
                      : Colors.green.shade800,
                ),
              ),
              child: ListTile(
                leading: transactions[index].category == 'food'
                    ? const Icon(Icons.restaurant)
                    : transactions[index].category == 'fuel'
                        ? const Icon(Icons.bike_scooter)
                        : transactions[index].category == 'salary'
                            ? const Icon(Icons.money)
                            : const Icon(Icons.account_balance_wallet),
                title: Text(
                  transactions[index].title!,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].date!),
                ),
                // trailing: IconButton(
                //     icon: const Icon(Icons.delete),
                //     onPressed: () => deleteTx(transactions[index].id)),
                trailing: Column(
                  children: [
                    Text(
                      transactions[index].amount.toString(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}
