import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project01/utils/nav.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("User user"),
            accountEmail: Text("user@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black87,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
          ),
          _listTile(context, Icons.favorite, "Favorites", "Your favorites..."),
          _listTile(context, Icons.help, "Help", "About us..."),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              if (kDebugMode) {
                print("Favorites");
              }
              pop(context);
            },
          )
        ],
      ),
    );
  }
}

_listTile(context, icon, String title, String info) {
  return ListTile(
    leading: Container(padding: const EdgeInsets.only(top: 8), child: Icon(icon)),
    title: Text(title),
    subtitle: Text(info),
    trailing: const Icon(Icons.arrow_forward),
    onTap: () {
      if (kDebugMode) {
        print("Favorites");
      }
      pop(context);
    },
  );
}
