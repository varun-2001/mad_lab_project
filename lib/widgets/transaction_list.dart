import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mad_lab_project/model/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'No Transactions Yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date!),
                  ),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => deleteTx(transactions[index].id)),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
