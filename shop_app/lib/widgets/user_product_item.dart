import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final scaffoldManager = ScaffoldMessenger.of(context);
    return ListTile(
      tileColor: Colors.grey.withOpacity(0.2),
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeId, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Remove Shop item'),
                    content:
                        Text('Do you want to remove the item from the Shop?'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No')),
                      TextButton(
                          onPressed: () async {
                            try {
                              await Provider.of<Products>(context,
                                      listen: false)
                                  .deleteProduct(id);
                            } catch (error) {
                              scaffoldManager.showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Deleting failed!!',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                            Navigator.of(context).pop();
                          },
                          child: Text('Yes')),
                    ],
                  ),
                );
              },
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}
