// import 'package:flutter/material.dart';

// class RepTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String hintText;
//   final Function(String) onChanged;

//   const RepTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       maxLines: 1,
//       cursorColor: Colors.black,
//       style: const TextStyle(color: Colors.black),
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Colors.grey),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.grey.shade300),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.grey.shade500),
//         ),
//       ),
//       onChanged: onChanged,
//     );
//   }
// }
