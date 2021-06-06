import 'package:flutter/material.dart';
import 'package:flutter_docker/screens/tabs_image.dart';
import 'tab_text.dart';

class GeneratedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //inserting the tabs length
length: 3,
      //end inserting the tabs length
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              //inserting tabs title exemple : TabText("tab1")

TabText(" this is tab3"),
TabText(" this is tab2"),
TabText(" this is tab1"),
              //end inserting tabs
            ],
          ),
        ),
        body: TabBarView(
          children: [
TabsImage("asset/image2.jpg"," this is tab3"),
            //inserting tabs images exemple : TabsImage('asset/image1.jpg')
TabsImage("asset/image1.jpg"," this is tab2"),

TabsImage("asset/image0.jpg"," this is tab1"),
            //inserting tabs images
          ],
        ),
      ),
    );
  }
}
