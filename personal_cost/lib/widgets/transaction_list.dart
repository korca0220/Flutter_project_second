import 'package:flutter/material.dart';
import 'package:personal_cost/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;
  TransactionList({this.transactions, this.delTx});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'No transactions added yet!!',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                child: Center(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 6,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(
                      child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(0)}'),
                    ),
                  ),
                  title: Text(
                    '${transactions[index].title}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () => delTx(transactions[index])),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
