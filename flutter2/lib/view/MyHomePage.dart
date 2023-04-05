import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/editprofile.dart';
import 'package:flutter2/view/homecust.dart';

import 'logintest.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 30),
          ListTile(
            leading: Icon(Icons.person,color: globalcolors.textcolor),
            title: Text('Profile'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const homecust()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.language,color: globalcolors.textcolor),
            title: Text('Language'),
            onTap: () => {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const homecust()),
            )
              },
          ),

          ListTile(
            leading: Icon(Icons.info_outline,color: globalcolors.textcolor),
            title: Text('About us'),
            onTap: () => {
              //Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color,color: globalcolors.textcolor),
            title: Text('Feedback'),
            onTap: () => {
            //  Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,color: globalcolors.textcolor),
            title: Text('Logout'),
            onTap: () => {
            //  Navigator.of(context).pop()
            },
          ),
        ],
      ),
    );
  }
}