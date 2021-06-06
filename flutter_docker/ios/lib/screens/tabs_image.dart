import 'package:flutter/material.dart';

class TabsImage extends StatelessWidget {
  final String imagePath;
  final String imageTitle;
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
                matchTextDirection: false,
              ),
              title: Text(imageTitle),
              subtitle: Text('image description.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('view more'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 100),
                TextButton(
                  child: const Text('enter'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
