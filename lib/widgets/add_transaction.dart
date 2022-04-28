// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

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
  File? image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    this.image = imageTemporary;
    setState(() =>this.image=imageTemporary);
  }

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.51,
        width: MediaQuery.of(context).size.width - 20,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Transaction',
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // ENTER AMOUNT
            EnterAmount(amountController: amountController),

            const SizedBox(height: 10),

            // CHOOSE DATE
            EnterDate(dateController: dateController),

            // CHOOSE CATEGORY
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                  hint: const Text('Choose category'),
                  underline: Container(),
                  value: dropdownValue,
                  isExpanded: true,
                  items: category.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1),
                ),
                labelText: 'Description',
                hintText: 'Enter description',
              ),
            ),

            const SizedBox(height: 10),

            // Camera Picker
            GestureDetector(
              onTap: ()=>pickImage,
              child: Center(
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black38, width: 2),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.black38,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnterDate extends StatelessWidget {
  const EnterDate({
    Key? key,
    required this.dateController,
  }) : super(key: key);

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Date',
        hintText: 'Choose date of transaction',
      ),
    );
  }
}

class EnterAmount extends StatelessWidget {
  const EnterAmount({
    Key? key,
    required this.amountController,
  }) : super(key: key);

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: amountController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Amount',
        hintText: 'Enter amount',
      ),
    );
  }
}
