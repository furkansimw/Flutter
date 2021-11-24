import 'dart:io';
import 'package:add_to_gallery/add_to_gallery.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

//?BASIC CAMERA APP

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(ma());
}

class ma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: camera(),
    );
  }
}

class camera extends StatefulWidget {
  @override
  _cameraState createState() => _cameraState();
}

List<CameraDescription> cameras = []; //camera for

class _cameraState extends State<camera> {
  CameraController controller =
      CameraController(cameras[0], ResolutionPreset.ultraHigh);
  @override
  void initState() {
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then(
      (value) {
        if (!mounted) {
          return;
        } else {
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double sliderValue = 1;
  bool cameraChange = true;
  bool zoomSetting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onDoubleTap: () => changeCamera(),
                  child: CameraPreview(controller), //here camera preview
                ),
              ],
            ),
            Visibility(
              visible: zoomSetting,
              child: Container(
                height: 25,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Slider(
                  value: sliderValue,
                  thumbColor: Colors.black,
                  min: 1,
                  max: 4,
                  onChanged: (newValue) {
                    setState(() {
                      sliderValue = newValue;
                      controller.setZoomLevel(newValue);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                //setting container
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      images.isNotEmpty
                          ? GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => page2(
                                    () => update(),
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                width: 50,
                                child: Image.file(
                                  images.last,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () => _notFound(),
                              child: const SizedBox(
                                width: 50,
                                child: Icon(Icons.photo, size: 30),
                              ),
                            ),
                      IconButton(
                        onPressed: () {
                          takePhoto();
                        },
                        icon: const Icon(Icons.camera, size: 30),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(
                              () {
                                zoomSetting = !zoomSetting;
                              },
                            );
                          },
                          icon: const Icon(Icons.settings, size: 30)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _notFound() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('not found photo'),
    ));
  }

  void update() {
    setState(() {
      images;
    });
  }

  void takePhoto() async {
    FlashMode flashMode = FlashMode.off;
    await controller.setFlashMode(flashMode);
    var taked = await controller.takePicture();

    File image = File(taked.path);
    setState(() {
      images.add(image);
    });
  }

  void changeCamera() {
    setState(
      () {
        cameraChange = !cameraChange;
        controller = CameraController(
            cameras[cameraChange ? 0 : 1], ResolutionPreset.ultraHigh);
        controller.initialize().then(
          (value) {
            if (!mounted) {
              return;
            } else {
              setState(() {});
            }
          },
        );
      },
    );
  }
}

class page2 extends StatefulWidget {
  var update;
  page2(this.update);
  @override
  _page2State createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Image.file(images[i]),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                images.removeAt(i);
                                widget.update();

                              },
                            );
                          },
                          icon: const Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () async {
                            await AddToGallery.addToGallery(
                                    originalFile: images[i],
                                    albumName: 'app',
                                    deleteOriginalFile: false)
                                .whenComplete(
                              () {
                                setState(
                                  () {
                                    images.removeAt(i);
                                    widget.update();
                                  },
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.downloading,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

List<File> images = [];
