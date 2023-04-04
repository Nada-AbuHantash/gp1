import 'package:flutter2/components/applocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/editprofail.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/init.dart';
import 'package:flutter2/view/about/about.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:flutter2/view/logintest.dart';
import 'package:flutter2/view/signup.dart';
class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<settings> {

  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    editprofail(),
    logintest(),
    AboutScreen(),
    home(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(

                icon: Icon(Icons.person,color: globalcolors.textcolor),
                selectedIcon: Icon(Icons.person_outline_outlined,color: globalcolors.notetcolor),
                label: Text('Profile'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.language,color: globalcolors.textcolor),
                selectedIcon: Icon(Icons.language_outlined,color: globalcolors.notetcolor),
                label: Text('Language'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.info_rounded,color: globalcolors.textcolor),
                selectedIcon: Icon(Icons.info_outline,color: globalcolors.notetcolor),
                label: Text('About us'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.logout,color: globalcolors.textcolor),
                selectedIcon: Icon(Icons.logout_outlined,color: globalcolors.notetcolor),
                label: Text('Log out'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: _pages[_selectedIndex],

            ),

        ],
      ),
    );

  }

}