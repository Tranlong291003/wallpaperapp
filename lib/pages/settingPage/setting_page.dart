import 'package:flutter/material.dart';
import 'package:wallpaper/apps/utils/appBar.dart'; // Import AppBar tùy chỉnh của bạn
import 'package:wallpaper/controllers/authentic_Controller.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = AuthenticController(); // Khởi tạo AuthController

    return Scaffold(
      appBar: appBar(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              _buildAppHeader(context),
              const SizedBox(height: 20),
              _buildFeaturesCard(
                  context), // Thay đổi phần giới thiệu thành tính năng chính
              const SizedBox(height: 20),
              _buildContactCard(context),
              const SizedBox(height: 20),
              _buildLogoutButton(
                  context, authController), // Thêm phần đăng xuất
              const SizedBox(height: 20),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppHeader(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Icon(
            Icons.wallpaper, // Biểu tượng của Flutter
            size: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 10),
          Text(
            'Ứng Dụng Wallpaper',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'Nguồn Wallpaper Đỉnh Cao Của Bạn',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesCard(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Tính Năng Chính',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              '1. Bộ Sưu Tập Hình Nền Đẹp: Duyệt qua hàng nghìn hình nền chất lượng cao để tìm những hình ảnh phù hợp với sở thích của bạn.\n'
              '2. Cài Đặt Nhanh Chóng: Cài đặt hình nền chỉ với một vài lần chạm, dễ dàng và tiện lợi.\n'
              '3. Danh Mục Đa Dạng: Khám phá nhiều thể loại hình nền khác nhau như phong cảnh, thiên nhiên, thành phố, và nhiều hơn nữa.\n'
              '4. Tìm Kiếm Thông Minh: Tìm kiếm hình nền yêu thích của bạn bằng các từ khóa hoặc thể loại cụ thể.\n'
              '5. Tùy Chỉnh Cá Nhân: Lưu các hình nền yêu thích và tạo bộ sưu tập cá nhân của riêng bạn.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Liên Hệ Chúng Tôi',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email,
                  color: Theme.of(context).colorScheme.primary),
              title: const Text('Email: support@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone,
                  color: Theme.of(context).colorScheme.primary),
              title: const Text('Điện Thoại: +1 234 567 890'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(
      BuildContext context, AuthenticController authController) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading:
            Icon(Icons.logout, color: Theme.of(context).colorScheme.primary),
        title: Text(
          'Đăng Xuất',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        onTap: () {
          authController.signOut(context);
        },
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Center(
      child: Text(
        '© 2024 Ứng Dụng Wallpaper. Bảo Lưu Toàn Quyền.',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
