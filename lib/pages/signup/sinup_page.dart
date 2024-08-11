import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper/apps/utils/box_login.dart';
import 'package:wallpaper/pages/home/home_page.dart';
import 'package:wallpaper/pages/login/login_page.dart';

class SinupPage extends StatefulWidget {
  const SinupPage({super.key});

  @override
  State<SinupPage> createState() => _SinupPageState();
}

class _SinupPageState extends State<SinupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Ẩn dấu quay lại
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Đăng Ký',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 6),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  children: const <TextSpan>[
                    TextSpan(text: 'Tạo một tài khoản mới\n'),
                    TextSpan(
                        text: 'bạn có thể khám phá tất cả hình ảnh hiện có!'),
                  ],
                ),
              ),
              const SizedBox(height: 53),
              const BoxSign(hintText: 'Email'),
              const SizedBox(height: 26),
              const BoxSign(hintText: 'Mật khẩu', obscureText: true),
              const SizedBox(height: 26),
              const BoxSign(hintText: 'Nhập lại mật khẩu', obscureText: true),
              const SizedBox(height: 53),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  width: 357,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Đăng ký',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40), // Add spacing between buttons
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  'Đã có tài khoản',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 75),
              const Text(
                'Hoặc tiếp tục với',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 44,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.g_mobiledata,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 44,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.facebook),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 44,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.apple),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
