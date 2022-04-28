// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mad_lab_project/final/home_page.dart';
import 'package:mad_lab_project/google_sheets_api.dart';
import 'package:mad_lab_project/top_card.dart';
import 'package:mad_lab_project/widgets/add_transaction.dart';
// import 'package:mad_lab_project/widgets/balance_card.dart';
import 'package:mad_lab_project/widgets/individual_transaction.dart';

import 'model/transactions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetsApi().init();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    ),
  );
}

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
        isExpense: true),
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
        isExpense: true),
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
        isExpense: true),
    Transaction(
        id: 't6',
        title: 'Pasta',
        amount: 93.97,
        date: DateTime.now().subtract(const Duration(days: 5)),
        category: 'food',
        isExpense: true),
  ];

  final appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Center(
        child: Text(
          'FinTrack',
          style: GoogleFonts.pacifico(
            textStyle: const TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
      ));

  // POPUP TO ADD NEW TRANSACTION
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return const AddTransaction();
        });
  }

  @override
  Widget build(BuildContext context) {
    final indiTrans = (MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top) *
        0.7;

    // Sorts all the transactions by date
    _userTransactions.sort((a, b) => b.date!.compareTo(a.date!));
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const TopCard(
                  balance: '20,000', income: '10,000', expense: '10,000'),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('T R A N S A C T I O N'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                    height: indiTrans + 20,
                    child:
                        IndividualTransaction(transactions: GoogleSheetsApi.currentTransactions)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
