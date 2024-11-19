import 'package:ct484_project/shared/slider_drawer.dart' as shared;
import 'package:ct484_project/view/detail/detail_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../../../utils/colors.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<SliderDrawerState> dKey = GlobalKey<SliderDrawerState>();

    return Scaffold(
      body: SliderDrawer(
        key: dKey,
        animationDuration: 500,
        slider: shared.MySlider(),
        appBar: DetailAppBar(
          drawerKey: dKey,
          title: "Details", // Tiêu đề AppBar
        ),
        child: _buildDetailContent(context),
      ),
    );
  }

  Widget _buildDetailContent(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Task Details",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "This is a detailed view of a task. You can add more information or edit the content here.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
