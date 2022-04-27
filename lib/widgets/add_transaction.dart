// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  var category = ['Food', 'Fuel', 'Salary'];
  String dropdownValue = 'Food';
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          children: [
            // ENTER AMOUNT
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                hintText: 'Enter amount',
              ),
            ),

            // CHOOSE DATE
            TextField(
              controller: dateController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: 'Date',
                hintText: 'Choose date of transaction',
              ),
            ),

            // CHOOSE CATEGORY
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: DropdownButton(
                  value: dropdownValue,
                  isExpanded: true,
                  items: category.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(
                      () {
                        dropdownValue = newValue!;
                      },
                    );
                  }),
            ),

            // ENTER DESCRIPTION
            TextField(
              controller: descriptionController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter description',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
