// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import '../../../view/tasks/task_view.dart';
// import '../../../utils/colors.dart';

// class FAB extends StatelessWidget {
//   const FAB({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(
//           CupertinoPageRoute(
//             builder: (context) => TaskView(
//               taskControllerForSubtitle: null,
//               taskControllerForTitle: null,
//               task: null,
//             ),
//           ),
//         );
//       },
//       child: Material(
//         borderRadius: BorderRadius.circular(15),
//         elevation: 10,
//         child: Container(
//           width: 70,
//           height: 70,
//           decoration: BoxDecoration(
//             color: MyColors.primaryColor,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: const Center(
//               child: Icon(
//             Icons.add,
//             color: Colors.white,
//             size: 30, // Đảm bảo kích thước icon chính xác
//           )),
//         ),
//       ),
//     );
//   }
// }
