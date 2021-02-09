import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_cost/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.delTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function delTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableCorlors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple
    ];
    _bgColor = availableCorlors[Random().nextInt(availableCorlors.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 6,
      child: ListTile(
        key: widget.key,
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: _bgColor,
          child: FittedBox(
            child: Text('\$${widget.transaction.amount.toStringAsFixed(0)}'),
          ),
        ),
        title: Text(
          '${widget.transaction.title}',
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 440
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => widget.delTx(widget.transaction))
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => widget.delTx(widget.transaction)),
      ),
    );
  }
}
