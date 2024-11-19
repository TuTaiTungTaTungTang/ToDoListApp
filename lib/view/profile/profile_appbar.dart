import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

// ignore: must_be_immutable, camel_case_types
class profileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const profileAppBar({
    super.key,
    required this.drawerKey,
    required this.title,
    required TextStyle titleStyle,
    required Alignment titleAlignment,
    required EdgeInsets titlePadding, // Tiêu đề động
  });

  final GlobalKey<SliderDrawerState> drawerKey;
  final String title; // Tiêu đề của AppBar

  @override
  State<profileAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _MyAppBarState extends State<profileAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Toggle cho drawer và animation icon
  void toggle() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if (isDrawerOpen) {
        controller.forward();
        widget.drawerKey.currentState?.openSlider();
      } else {
        controller.reverse();
        widget.drawerKey.currentState?.closeSlider();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Thêm màu nền xanh
      child: SizedBox(
        width: double.infinity,
        height: 132,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Animated Icon - Menu & Close
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: controller,
                    size: 40,
                    color: Colors.white, // Icon màu trắng
                  ),
                  onPressed: toggle,
                ),
              ),

              /// Tiêu đề
              Text(
                widget.title, // Tiêu đề động
                style: const TextStyle(
                  fontSize: 28, // Kích thước chữ lớn hơn
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Chữ màu trắng
                ),
              ),

              /// Placeholder để căn đều hai bên
              const SizedBox(width: 60),
            ],
          ),
        ),
      ),
    );
  }
}
