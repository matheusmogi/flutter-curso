import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return transactions.length > 0
        ? Container(
            height: 300,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.purple,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 17),
                        child: Text(
                          NumberFormat.currency(
                            symbol: "R\$",
                          ).format(tr.value),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tr.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                            style: TextStyle(color: Colors.blueGrey[400]),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          )
        : Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  "Dados não encontrados.",
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
              ),
              Text(
                "Adicione sua primeira transação abaixo.",
                style: TextStyle(fontSize: 13, color: Colors.grey[800]),
              ),
            ],
          );
  }
}
