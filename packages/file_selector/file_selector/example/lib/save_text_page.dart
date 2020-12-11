import 'dart:typed_data';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

/// Page for showing an example of saving with file_selector
class SaveTextPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _saveFile() async {
    final String path = await getSavePath();
    final String text = _contentController.text;
    final String fileName = _nameController.text;
    final Uint8List fileData = Uint8List.fromList(text.codeUnits);
    final String fileMimeType = 'text/plain';
    final XFile textFile =
        XFile.fromData(fileData, mimeType: fileMimeType, name: fileName);
    await textFile.saveTo(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save text into a file"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              child: TextField(
                minLines: 1,
                maxLines: 12,
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: '(Optional) Suggest File Name',
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                minLines: 1,
                maxLines: 12,
                controller: _contentController,
                decoration: InputDecoration(
                  hintText: 'Enter File Contents',
                ),
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Press to save a text file'),
              onPressed: () => _saveFile(),
            ),
          ],
        ),
      ),
    );
  }
}
