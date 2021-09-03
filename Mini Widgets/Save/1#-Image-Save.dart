

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

void main() => runApp(app());


//https://pub.dev/packages/screenshot
//https://pub.dev/packages/share
//https://pub.dev/packages/image_gallery_saver
//https://pub.dev/packages/permission_handler


//androidManifest -> application -> android:requestLegacyExternalStorage="true"
//application -> parent   <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>   <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
  


class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

var imageUrl =
    "https://pbs.twimg.com/profile_banners/3187449916/1542466958/600x200";

class Home extends StatelessWidget {
  ScreenshotController _controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Screenshot(
            controller: _controller,
            child: Container(
              color: Colors.black12,
              height: 400,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    "$imageUrl",
                  ),
                  Center(
                    child: Text("Merhaba"),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              screenShot();
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  void screenShot() async {
    var image = await _controller.capture();
    if (image != null) {
      await saveImage(image);
    }
  }

  Future<String> saveImage(Uint8List image) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', "-");

    final name = "cool_photo$time";
    final result = await ImageGallerySaver.saveImage(image, name: name);

    return result['filePath'];
  }
}
