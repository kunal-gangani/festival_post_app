import 'dart:io';
import 'package:festival_post_maker_app/model/festival_post_model_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> images = [
    "assets/background/bg1.jpg",
    "assets/background/bg2.jpg",
    "assets/background/bg3.jpg",
    "assets/background/bg4.jpg",
    "assets/background/bg5.jpg",
    "assets/background/bg6.jpg",
    "assets/background/bg7.jpg",
    "assets/background/bg8.jpg",
    "assets/background/bg9.jpg",
  ];

  Color backgroundColor = Colors.white;
  bool isBackgroundImage = true;
  String? selectedImage;
  Color fontColour = Colors.black87;
  String font = "Arial";
  bool isItalic = false;
  GlobalKey key = GlobalKey();

  List<String> availableFonts = [
    "Arial",
    "Courier New",
    "Georgia",
    "Times New Roman",
    "Verdana",
  ];

  Future<void> copyQuote({required FestivalPostModelClass fest}) async {
    await Clipboard.setData(
      ClipboardData(text: "${fest.fDesc}\n ~ ${fest.fName}"),
    ).then((value) {
      SnackBar snackBar = const SnackBar(
        content: Text("Quote copied to clipboard"),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  Future<void> saveToGallery() async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final buffer = byteData!.buffer.asUint8List();
      final result = await ImageGallerySaver.saveImage(buffer);
      if (result['isSuccess']) {
        SnackBar snackBar = const SnackBar(
          content: Text("Image saved to gallery"),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      SnackBar snackBar = const SnackBar(
        content: Text("Failed to save image"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> shareImage() async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final buffer = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final file = await File('${directory.path}/post_image.png').create();
      await file.writeAsBytes(buffer);

      await ShareExtend.share(file.path, "image");
    } catch (e) {
      SnackBar snackBar = const SnackBar(
        content: Text("Failed to share image"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    FestivalPostModelClass fest =
        ModalRoute.of(context)!.settings.arguments as FestivalPostModelClass;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade700,
        elevation: 0,
        centerTitle: true,
        title: Text(
          fest.fName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Display Section for Quote
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: RepaintBoundary(
                  key: key,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isBackgroundImage ? null : backgroundColor,
                      image: isBackgroundImage && selectedImage != null
                          ? DecorationImage(
                              image: AssetImage(selectedImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            fest.fDesc,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontStyle: isItalic
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: fontColour,
                              fontFamily: font,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "- ${fest.fReligion}",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: fontColour,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Customization Section
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    // Toggle for Background Mode
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Use Image Background",
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        Switch(
                          value: isBackgroundImage,
                          onChanged: (value) {
                            setState(() {
                              isBackgroundImage = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Text(
                      "Use Color Background",
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    // Choose Background Image
                    Visibility(
                      visible: isBackgroundImage,
                      child: Column(
                        children: [
                          Text(
                            "Choose your desired background image:",
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            height: 75.h,
                            child: ListView.builder(
                              itemCount: images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedImage = images[index];
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 25.h,
                                      backgroundImage:
                                          AssetImage(images[index]),
                                      backgroundColor: Colors.grey.shade200,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Choose Background Color (Moved Below Image Selection)
                    Visibility(
                      visible: !isBackgroundImage,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Choose Background Color:",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Pick a color",
                                          style: TextStyle(fontSize: 16.sp),
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ColorPicker(
                                              pickerColor: backgroundColor,
                                              onColorChanged: (color) {
                                                setState(() {
                                                  backgroundColor = color;
                                                });
                                              },
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Select"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.color_lens),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Font Customization Options
                    Visibility(
                      visible: !isBackgroundImage,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Font Selector
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Select Font:",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              DropdownButton<String>(
                                value: font,
                                items: availableFonts.map((String font) {
                                  return DropdownMenuItem<String>(
                                    value: font,
                                    child: Text(font),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    font = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                          // Italics Toggle
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Italicize Quotes:",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Switch(
                                activeColor: backgroundColor,
                                activeTrackColor:
                                    backgroundColor.withOpacity(0.5),
                                inactiveTrackColor: Colors.grey,
                                inactiveThumbColor: Colors.black,
                                value: isItalic,
                                onChanged: (value) {
                                  setState(() {
                                    isItalic = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Select Font Color:",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Pick a color",
                                          style: TextStyle(fontSize: 16.sp),
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ColorPicker(
                                              pickerColor: fontColour,
                                              onColorChanged: (color) {
                                                setState(() {
                                                  fontColour = color;
                                                });
                                              },
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Select"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.color_lens),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Save and Share Buttons
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => saveToGallery(),
                            icon: const Icon(Icons.save),
                            label: const Text("Save Post"),
                          ),
                          const SizedBox(width: 30),
                          ElevatedButton.icon(
                            onPressed: () => shareImage(),
                            icon: const Icon(Icons.share),
                            label: const Text("Share Post"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
