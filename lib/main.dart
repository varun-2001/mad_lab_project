// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:mad_lab_project/widgets/balance_card.dart';
import 'package:mad_lab_project/widgets/individual_transaction.dart';

import 'model/transactions.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Pocket Money',
      amount: 694.99,
      date: DateTime.now(),
      isExpense: false,
      category: 'salary',
    ),
    Transaction(
      id: 't2',
      title: 'Petrol',
      amount: 434.97,
      date: DateTime.now().subtract(const Duration(days: 2)),
      isExpense: true,
      category: 'fuel',
    ),
    Transaction(
      id: 't3',
      title: 'Nachos',
      amount: 79.99,
      date: DateTime.now().subtract(const Duration(days: 3)),
      category: 'food',
      isExpense: true
    ),
    Transaction(
      id: 't5',
      title: 'Salary',
      amount: 33.99,
      date: DateTime.now().subtract(const Duration(days: 4)),
      isExpense: false,
      category: 'salary',
    ),
    Transaction(
      id: 't6',
      title: 'Pizza',
      amount: 93.97,
      date: DateTime.now().subtract(const Duration(days: 5)),
      category: 'food',
      isExpense: true
    ),
    Transaction(
      id: 't3',
      title: 'Rewards',
      amount: 79.99,
      date: DateTime.now().subtract(const Duration(days: 3)),
      isExpense: false,
      category: 'salary',
    ),
    Transaction(
      id: 't5',
      title: 'Fuel',
      amount: 33.99,
      date: DateTime.now().subtract(const Duration(days: 4)),
      category: 'fuel',
      isExpense: true
    ),
    Transaction(
      id: 't6',
      title: 'Pasta',
      amount: 93.97,
      date: DateTime.now().subtract(const Duration(days: 5)),
      category: 'food',
      isExpense: true
    ),

  ];
  final appBar = AppBar(title: const Center(child: Text('FinTrack')));

  @override
  Widget build(BuildContext context) {
    // Sorts all the transactions by date
    _userTransactions.sort((a, b) => b.date!.compareTo(a.date!));
    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const AccountsCard(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:5.0),
                child: SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                    child: IndividualTransaction(transactions: _userTransactions)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
