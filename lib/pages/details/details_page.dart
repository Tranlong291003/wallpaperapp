import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:wallpaper/apps/utils/appBar.dart';
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

    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Stack(
        children: [
          Center(
            child: Image.network(
              photo.src.original, // Display full-screen image
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity, // Ensure the image fills the screen
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () => _saveImage(context),
              backgroundColor: Theme.of(context).colorScheme.surface,
              child: Icon(
                Icons.download,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
