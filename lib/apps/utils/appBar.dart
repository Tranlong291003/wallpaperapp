import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/controllers/authentic_Controller.dart';
import 'package:wallpaper/providers/theme_provider.dart';
// Nếu bạn sử dụng Firebase Authentication

AppBar appBar(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final AuthenticController authController = AuthenticController();

  return AppBar(
    toolbarHeight: 70,
    title: Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, bottom: 15),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'WallTKL',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            const TextSpan(
              text: '.',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff00E809), // Màu sắc của dấu chấm
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20, top: 20, bottom: 10),
        child: IconButton(
          icon: Image.asset(
            isDarkMode
                ? 'assets/images/Icon/themedark.png'
                : 'assets/images/Icon/themelight.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            // Toggle giữa chế độ sáng và tối
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
        ),
      ),
    ],
    automaticallyImplyLeading: false, // Ẩn nút quay lại
  );
}
