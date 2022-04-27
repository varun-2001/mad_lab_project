// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class TopCard extends StatefulWidget {
  final String balance;
  final String income;
  final String expense;

  const TopCard(
      {Key? key,
      required this.balance,
      required this.income,
      required this.expense})
      : super(key: key);

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'B A L A N C E',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
              ),
              Text(
                '\$' + widget.balance,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // INCOME
                    DisplayIncome(widget: widget),

                    // EXPENSE
                    DisplayExpense(widget: widget),
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1),
            ]),
      ),
    );
  }
}

class DisplayIncome extends StatelessWidget {
  const DisplayIncome({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final TopCard widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: Center(
            child: Icon(
              Icons.arrow_upward,
              color: Colors.green,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(
              'Income',
              style: TextStyle(
                // fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '\$' + widget.income,
              style: TextStyle(
                // fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DisplayExpense extends StatelessWidget {
  const DisplayExpense({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final TopCard widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: Center(
            child: Icon(
              Icons.arrow_downward,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(
              'Expense',
              style: TextStyle(
                // fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '\$' + widget.expense,
              style: TextStyle(
                // fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
