// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../Navigation/bottom_navigation_bar.dart';
import '../Navigation/ontop_navigation_bar.dart';

class MyDocuments extends StatefulWidget {
  const MyDocuments({Key? key}) : super(key: key);

  @override
  State<MyDocuments> createState() => _MyDocumentsState();
}

class Photo {
  late File image;
  late String name;

  Photo(File file, String desc) {
    image = file;
    name = desc;
  }

  void setImage(File image) {
    this.image = image;
  }

  void setName(String name) {
    this.name = name;
  }

  File getImage() {
    return image;
  }

  String getName() {
    return name;
  }
}

class _MyDocumentsState extends State<MyDocuments> {
  List<Photo> images = [];
  final TextEditingController _text = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _takeImage(String desc) async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images.add(Photo(File(pickedFile.path), desc));
      });
    }
  }

  Future<void> _deleteImages() async {
    images.last.setName(_text.toString());
    _text.clear();
    for (int i = 0; i < images.length; ++i) {
      if (kDebugMode) {
        print(images[i].getImage());
      }
      if (kDebugMode) {
        print(images[i].getName());
      }
    }
    setState(() {
      images.clear();
    });
  }

  _displayDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Name of document'),
            content: TextField(
              controller: _text,
              decoration: const InputDecoration(hintText: "Put a name"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('SUBMIT'),
                onPressed: () {
                  _text.clear();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Documents',
      home: Scaffold(
        backgroundColor: const Color(0xFF293441),
        appBar: const OnTopNavigationBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 500,
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    'Personal Documents',
                    style: TextStyle(
                      fontFamily: 'Louis George Cafe',
                      color: Color(0xFFe5e7e8),
                      fontSize: 35,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FloatingActionButton(
                        backgroundColor: const Color(0xFF101c2b),
                        onPressed: () {
                          _displayDialog(context);
                          _takeImage(_text.toString());
                          images.last.setName(_text.toString());
                        },
                        child: const Icon(
                          Icons.add,
                          color: Color(0xFFe5e7e8),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Add your personal photos',
                          style: TextStyle(
                            fontFamily: 'Louis George Cafe',
                            color: Color(0xFFe5e7e8),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FloatingActionButton(
                        backgroundColor: const Color(0xFF101c2b),
                        onPressed: _deleteImages,
                        child: const Icon(
                          Icons.remove,
                          color: Color(0xFFe5e7e8),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Delete your personal photos',
                          style: TextStyle(
                            fontFamily: 'Louis George Cafe',
                            color: Color(0xFFe5e7e8),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50, right: 8.0, left: 8.0),
                  child: SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Image.file(images[index].getImage());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const ButtomNavigationBar(),
      ),
    );
  }
}
