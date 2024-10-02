import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/features/home/manager/home_manager.dart';
import 'package:flutter_guess_game/features/home/view/components/home_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  static const routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: context.greenColor.shade700,
        body: ValueListenableBuilder(
          valueListenable: selectedHomeFragments,
          builder: (context, value, child) {
            return selectedHomeFragMap[selectedHomeFragments.value]!;
          },
        ),
        bottomNavigationBar: const HomeBottomBar(),
      ),
    );
  }
}
