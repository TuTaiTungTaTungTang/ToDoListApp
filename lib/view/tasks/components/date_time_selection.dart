// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
//     as date_time_picker;
// import 'package:intl/intl.dart';

// class DateTimeSelection extends StatelessWidget {
//   final DateTime? selectedTime;
//   final DateTime? selectedDate;
//   final Function(DateTime) onTimeChanged;
//   final Function(DateTime) onDateChanged;

//   const DateTimeSelection({
//     super.key,
//     required this.selectedTime,
//     required this.selectedDate,
//     required this.onTimeChanged,
//     required this.onDateChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () {
//             date_time_picker.DatePicker.showTimePicker(context,
//                 showTitleActions: true,
//                 onConfirm: onTimeChanged,
//                 currentTime: selectedTime ?? DateTime.now());
//           },
//           child: _buildPickerItem(
//               context,
//               'Time',
//               selectedTime != null
//                   ? DateFormat('hh:mm a').format(selectedTime!)
//                   : 'Select Time'),
//         ),
//         GestureDetector(
//           onTap: () {
//             date_time_picker.DatePicker.showDatePicker(context,
//                 showTitleActions: true,
//                 minTime: DateTime.now(),
//                 onConfirm: onDateChanged,
//                 currentTime: selectedDate ?? DateTime.now());
//           },
//           child: _buildPickerItem(
//               context,
//               'Date',
//               selectedDate != null
//                   ? DateFormat.yMMMEd().format(selectedDate!)
//                   : 'Select Date'),
//         ),
//       ],
//     );
//   }

//   Widget _buildPickerItem(BuildContext context, String label, String value) {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey.shade300, width: 1),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ListTile(
//         title: Text(label, style: Theme.of(context).textTheme.headlineSmall),
//         trailing: Text(value, style: Theme.of(context).textTheme.titleSmall),
//       ),
//     );
//   }
// }
