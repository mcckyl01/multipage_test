import 'package:multipage_test/fragments/dashboard.dart';
import 'package:multipage_test/fragments/add_bluelock.dart';
import 'package:multipage_test/fragments/get_token.dart';
import 'package:multipage_test/fragments/maintain_bluelocks.dart';
import 'package:multipage_test/fragments/issue_token.dart';
import 'package:multipage_test/fragments/maintain_issued_tokens.dart';
import 'package:multipage_test/fragments/token_usage_history.dart';
import 'package:multipage_test/fragments/order_bluelock.dart';
import 'package:multipage_test/fragments/choose_security_provider.dart';
import 'package:multipage_test/fragments/settings.dart';
import 'package:multipage_test/fragments/help.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Dashboard", Icons.dashboard),
    new DrawerItem("Add Bluelock", Icons.settings_remote),
    new DrawerItem("Get Token", Icons.add_to_photos),
    new DrawerItem("Maintain Bluelocks", Icons.settings),
    new DrawerItem("Issue Token", Icons.send),    
    new DrawerItem("Maintain Issued Tokens", Icons.vpn_key),
    new DrawerItem("Token Usage History", Icons.history),
    new DrawerItem("Order Bluelock", Icons.shopping_cart),
    new DrawerItem("Choose Security Provider", Icons.security),
    new DrawerItem("Settings", Icons.settings),
    new DrawerItem("Help", Icons.help),

  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Dashboard();
      case 1:
        return new AddBluelock();
      case 2:
        return new GetToken();
      case 3:
        return new MaintainBluelock();
      case 4:
        return new IssueToken();
      case 5:
        return new MaintainIssuedTokens();
      case 6:
        return new TokenUsageHistory();
      case 7:
        return new OrderBluelock();
      case 8:
        return new ChooseSecurityProvider();
      case 9:
        return new Settings();
      case 5:
        return new Help();        

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
       child: AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      ),
      
drawer: Drawer(
    elevation: 20.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 100,
      //         child: new UserAccountsDrawerHeader(
      //             accountName: new Text("John Doe"), accountEmail: null,
      //         ),
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
            image: AssetImage('assets/blue-logo.png'),
            fit: BoxFit.fitHeight,
            ),
            ), child: null,
          ),
        ),
        Expanded(
          child: ListView(children: drawerOptions
            
          ),
        )
      ],
    ),
  ),
       body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
