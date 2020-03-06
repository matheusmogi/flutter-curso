import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_expenses/Components/transaction_form.dart';
import 'Components/transaction_list.dart';
import 'Models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: "1",
        title: "Almoço",
        value: 23.90,
        date: DateTime.now().add(Duration(days: -1))),
    Transaction(id: "2", title: "Janta", value: 43.20, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    setState(() {
      _transactions.add(Transaction(
          title: title,
          value: value,
          date: DateTime.now(),
          id: Random().nextDouble().toString()));
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
        title: Text("Despesas Pessoais"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text("Chart"),
                elevation: 8,
                color: Colors.blueAccent,
              ),
            ),
            Column(
              children: <Widget>[
                TransactionList(_transactions) 
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
    );
  }
}
