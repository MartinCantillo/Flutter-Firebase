import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Icon(
                Icons.account_circle,
                size: 150,
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            title: Text('Save', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            title: Text('Get', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            title: Text('Delete', style: TextStyle(color: Colors.white)),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
