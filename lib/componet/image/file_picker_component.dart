import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerComponent extends StatefulWidget {
  final ValueChanged<File> onFileSelected;
  final ValueChanged onFileDeleted;

  const FilePickerComponent(
      {required this.onFileSelected, required this.onFileDeleted, Key? key})
      : super(key: key);

  @override
  _FilePickerComponentState createState() => _FilePickerComponentState();
}

class _FilePickerComponentState extends State<FilePickerComponent> {
  late File _selectedFile;
  String? filePath;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
        filePath = _selectedFile.path;
      });
      widget.onFileSelected(_selectedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _pickFile,
          child: Text('Select File'),
        ),
        ...[
          SizedBox(height: 20),
          if (filePath != null) Text('Selected File: ${filePath}'),
          ElevatedButton(
            onPressed: () {
              widget.onFileDeleted('_');
              setState(() {
                filePath = null;
              });
            },
            child: Text('clear File'),
          ),
        ],
      ],
    );
  }
}
