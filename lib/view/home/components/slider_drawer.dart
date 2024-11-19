// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import '../../../utils/colors.dart';

// /// My Drawer Slider
// // ignore: must_be_immutable
// class MySlider extends StatelessWidget {
//   MySlider({
//     super.key,
//   });

//   /// Icons
//   List<IconData> icons = [
//     CupertinoIcons.home,
//     CupertinoIcons.person_fill,
//     CupertinoIcons.settings,
//     CupertinoIcons.info_circle_fill,
//   ];

//   /// Texts
//   List<String> texts = [
//     "Home",
//     "Profile",
//     "Settings",
//     "Details",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var textTheme = Theme.of(context).textTheme;
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 90),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//             colors: MyColors.primaryGradientColor,
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight),
//       ),
//       child: Column(
//         children: [
//           const CircleAvatar(
//             radius: 50,
//             backgroundImage: AssetImage('assets/img/main.jpg'),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Text("Huynh Tu Tai", style: textTheme.displayMedium),
//           Text("trùm sylas việt nam", style: textTheme.displaySmall),
//           Container(
//             margin: const EdgeInsets.symmetric(
//               vertical: 30,
//               horizontal: 10,
//             ),
//             width: double.infinity,
//             height: 300,
//             child: ListView.builder(
//                 itemCount: icons.length,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (ctx, i) {
//                   return InkWell(
//                     // ignore: avoid_print
//                     onTap: () => print("$i Selected"),
//                     child: Container(
//                       margin: const EdgeInsets.all(5),
//                       child: ListTile(
//                           leading: Icon(
//                             icons[i],
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           title: Text(
//                             texts[i],
//                             style: const TextStyle(
//                               color: Colors.white,
//                             ),
//                           )),
//                     ),
//                   );
//                 }),
//           )
//         ],
//       ),
//     );
//   }
// }
