import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper/pages/introduction/introduction_custom.dart';
import 'package:wallpaper/pages/login/login_page.dart';
import 'package:wallpaper/providers/theme_provider.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  Future<void> _completeIntroduction(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setBool('seen', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            decoration: introductionCustom(),
            title: "Khám Phá Hình Nền Độc Đáo",
            body:
                "Khám phá bộ sưu tập hình nền độc đáo, chất lượng cao ngay trên ứng dụng.",
            image: Image.asset('assets/images/introduction/introduction1.png',
                fit: BoxFit.cover, width: double.infinity),
          ),
          PageViewModel(
            decoration: introductionCustom(),
            title: "Cá Nhân Hóa Màn Hình",
            body:
                "Tìm kiếm và cá nhân hóa màn hình của bạn với hàng triệu hình nền đẹp mắt.",
            image: Image.asset('assets/images/introduction/introduction2.png',
                fit: BoxFit.cover, width: double.infinity),
          ),
          PageViewModel(
            decoration: introductionCustom(),
            title: "Giao Diện Thân Thiện",
            body:
                "Giao diện thân thiện giúp bạn dễ dàng lựa chọn và thay đổi hình nền theo ý thích.",
            image: Image.asset('assets/images/introduction/introduction3.png',
                fit: BoxFit.cover, width: double.infinity),
          ),
        ],
        dotsDecorator: const DotsDecorator(
          activeColor: Colors.blue,
          size: Size(10.0, 10.0),
          activeSize: Size(12.0, 12.0),
          spacing: EdgeInsets.symmetric(horizontal: 4.0),
        ),
        showSkipButton: true,
        skip: const Text("Bỏ qua"),
        onSkip: () => _completeIntroduction(context),
        showNextButton: false,
        done: const Text("Đăng nhập"),
        onDone: () => _completeIntroduction(context),
      ),
    );
  }
}
