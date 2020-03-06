import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSave;

  TransactionForm(this.onSave);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    if (titleController.text.isEmpty || valueController.text.isEmpty) {
      return false;
    }
    widget.onSave(
        titleController.text, double.tryParse(valueController.text) ?? 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Descrição"),
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: "Valor (R\$)"),
              controller: valueController,
              onSubmitted: (_) => _submitForm(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text("Novo Lançamento"),
                  textColor: Colors.purple,
                  onPressed: _submitForm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
