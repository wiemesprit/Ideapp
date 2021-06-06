import 'package:flutter/material.dart';

class TabsImage extends StatelessWidget {
  final String imagePath;
  final String imageTitle;
  double height;
  double weidth;
  TabsImage(this.imagePath, this.imageTitle);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: new Image(
                image: new AssetImage(imagePath),
                alignment: Alignment.topLeft,
                repeat: ImageRepeat.noRepeat,
                height: 50,
                width: 100,
                matchTextDirection: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
