import 'package:flutter/material.dart';
import 'package:flutter_docker/main.dart';
import 'package:flutter_docker/screens/login_screen.dart';
import 'package:flutter_docker/screens/tabs_image.dart';
import 'tab_text.dart';

class GeneratedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        //inserting the tabs length
        length: 5,
        //end inserting the tabs length
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/splash.png'),
                  ),
                  accountName: Text('${MyApp?.currentUser?.username}'),
                  accountEmail: Text('${MyApp?.currentUser?.email}'),
                ),
                ListTile(
                  title: Text('Tab 1',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  leading:
                      Icon(Icons.radio_button_checked, color: Colors.green),
                  dense: true,
                ),
                ListTile(
                  title: Text('Tab 2',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  leading:
                      Icon(Icons.radio_button_checked, color: Colors.green),
                  dense: true,
                ),
                ListTile(
                  title: Text('Tab 3',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  leading:
                      Icon(Icons.radio_button_checked, color: Colors.green),
                  dense: true,
                ),
                ListTile(
                  title: Text('Tab 4',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  leading:
                      Icon(Icons.radio_button_checked, color: Colors.green),
                  dense: true,
                ),
                Spacer(),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.exit_to_app, color: Colors.green),
                  title: Text('Logout',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage('')),
                    );
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text('App name'),
            bottom: TabBar(
              tabs: [
                //inserting tabs title exemple : TabText("tab1")
                TabText("Tab 1"),
                TabText("Tab 2"),
                TabText("Tab 3"),
                TabText("Tab 4"),
                TabText("Tab 5"),
                //end inserting tabs
              ],
            ),
          ),
          body: TabBarView(
            children: [
              //inserting tabs images exemple : TabsImage('assets/image1.jpg')
              Container(child: Image.asset('assets/image0.jpg')),
              Container(child: Image.asset('assets/image1.jpg')),
              Container(child: Image.asset('assets/image2.jpg')),
              Container(child: Image.asset('assets/image3.jpg')),
              Container(child: Image.asset('assets/image4.jpg')),
              // TabsImage("assets/image0.jpg",""),
              //inserting tabs images
            ],
          ),
        ),
      ),
    );
  }
}
