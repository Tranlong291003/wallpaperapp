import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:wallpaper/models/photo.dart';

class PhotoDetailPage extends StatelessWidget {
  final Photo photo;

  const PhotoDetailPage({super.key, required this.photo});

  Future<void> _saveImage(BuildContext context) async {
    String? message;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      // Download image
      final http.Response response =
          await http.get(Uri.parse(photo.src.original));

      // Check if the response was successful
      if (response.statusCode == 200) {
        // Get temporary directory
        final dir = await getTemporaryDirectory();

        // Create an image name
        var filename = '${dir.path}/image.png';

        // Save to filesystem
        final file = File(filename);
        await file.writeAsBytes(response.bodyBytes);

        // Ask the user to save it
        final params = SaveFileDialogParams(
            sourceFilePath: file.path, fileName: 'image.png');
        final finalPath = await FlutterFileDialog.saveFile(params: params);

        if (finalPath != null) {
          message = 'Image saved to $finalPath';
        } else {
          message = 'Image save operation was canceled';
        }
      } else {
        message = 'Failed to download image';
      }
    } catch (e) {
      message = 'An error occurred while saving the image: $e';
    }

    scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.alt),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.orange),
            onPressed: () => _saveImage(context),
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          photo.src.original, // Hiển thị ảnh full màn hình
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
