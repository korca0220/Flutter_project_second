import 'package:flutter/material.dart';
import 'package:personal_cost/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.delTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function delTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: FittedBox(
            child: Text('\$${transaction.amount.toStringAsFixed(0)}'),
          ),
        ),
        title: Text(
          '${transaction.title}',
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 440
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => delTx(transaction))
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => delTx(transaction)),
      ),
    );
  }
}
