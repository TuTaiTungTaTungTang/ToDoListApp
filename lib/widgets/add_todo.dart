import 'package:flutter/material.dart';

class AddToDoWidget extends StatelessWidget {
  final TextEditingController todoController;
  final VoidCallback onAddPressed;

  const AddToDoWidget({
    Key? key,
    required this.todoController,
    required this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: todoController,
              decoration: InputDecoration(
                hintText: 'Add a new todo item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: onAddPressed,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
