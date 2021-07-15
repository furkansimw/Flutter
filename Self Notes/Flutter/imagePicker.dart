.yaml->
  image_picker: ^0.8.1+4

import 'package:image_picker/image_picker.dart';
import 'dart:io';


Future getPic() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    });
  }

  var _image; //this use
