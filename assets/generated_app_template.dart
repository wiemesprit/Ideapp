import 'package:flutter/material.dart';
import 'package:flutter_docker/screens/tabs_image.dart';
import 'tab_text.dart';

class GeneratedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //inserting the tabs length
      length: 2,
      //end inserting the tabs length
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              //inserting tabs title exemple : TabText("tab1")

              //end inserting tabs
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //inserting tabs images exemple : TabsImage('asset/image1.jpg')

            //inserting tabs images
          ],
        ),
      ),
    );
  }
}
