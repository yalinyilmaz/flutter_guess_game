import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/features/home/view/home_page.dart';
import 'package:flutter_guess_game/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:supercharged/supercharged.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const routeName = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(2.seconds, () {
        // 2 saniye sonra panel seçimi sayfasına gidilecek.
        globalCtx.go(HomePage.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.greenColor.shade700,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Assets.images.mainLogo.image()],
          ),
        ));
  }
}
