import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('access is denied');
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double rotate = 0;

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      extendBody: true,
      body: FutureBuilder(builder: (ctx, data) {
        if (data.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Stack(children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CameraPreview(controller)),
          Positioned(
              bottom: 50,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.camera,
                        size: 70,
                      ),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          if (rotate == 0) {
                            rotate = 90;
                          }else
                            {
                              rotate = 0;
                            }
                        });
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              )),
        ]);
      }),
    );
  }
}
