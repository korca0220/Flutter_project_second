import 'package:flutter/material.dart';
import 'package:meals_app/screens/filtter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      BuildContext ctx, String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(title, style: Theme.of(ctx).textTheme.headline5),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context).settings.name;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        elevation: 5,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile(
              context,
              'Meals',
              Icons.restaurant,
              () {
                if (route != '/') {
                  Navigator.of(context).pushReplacementNamed('/');
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            buildListTile(
              context,
              'Filters',
              Icons.settings,
              () {
                if (route != FilterScreen.routeName) {
                  Navigator.of(context)
                      .pushReplacementNamed(FilterScreen.routeName);
                } else {
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
