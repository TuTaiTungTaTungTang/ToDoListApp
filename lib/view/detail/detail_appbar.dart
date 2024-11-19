import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class DetailAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DetailAppBar({
    super.key,
    required this.drawerKey,
    required this.title,
  });

  final GlobalKey<SliderDrawerState> drawerKey;
  final String title;

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _DetailAppBarState extends State<DetailAppBar>
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
      color: Colors.blue, // Màu nền xanh
      child: SizedBox(
        width: double.infinity,
        height: 132,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Icon Menu
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
                widget.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Màu chữ trắng
                ),
              ),

              /// Placeholder
              const SizedBox(width: 60),
            ],
          ),
        ),
      ),
    );
  }
}