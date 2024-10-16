import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../widgets/search_box.dart';
import '../widgets/add_todo.dart';
import '../services/todo_service.dart';
import '../shared/app_drawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  late ToDoService toDoService;
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    toDoService = ToDoService(todosList: todosList);
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      drawer: AppDrawer(), // Sử dụng AppDrawer ở đây
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                SearchBox(onChanged: _runFilter),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 20,
                            bottom: 20), // Bạn có thể điều chỉnh khoảng cách
                        child: Text(
                          'All ToDos',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _confirmDeleteToDoItem,
                          onEditItem: _editToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AddToDoWidget(
              todoController: _todoController,
              onAddPressed: () => _addToDoItem(_todoController.text),
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      toDoService.handleToDoChange(todo);
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      toDoService.deleteToDoItem(id);
    });
  }

  void _addToDoItem(String toDoText) {
    setState(() {
      toDoService.addToDoItem(toDoText);
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      _foundToDo = toDoService.runFilter(enteredKeyword);
    });
  }
  // Cập nhật hàm xóa trong lớp Home: bạn có chắc muốn xóa

  void _confirmDeleteToDoItem(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Xác nhận xóa"),
          content: Text("Bạn có chắc chắn muốn xóa note này không?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: Text("Hủy"),
            ),
            TextButton(
              onPressed: () {
                _deleteToDoItem(id); // Gọi hàm xóa
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: Text("Xóa"),
            ),
          ],
        );
      },
    );
  }

// them ham edit
  void _editToDoItem(ToDo todo) {
    _todoController.text = todo.todoText!; // Điền vào TextEditingController
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Chỉnh sửa công việc"),
          content: TextField(
            controller: _todoController,
            decoration: InputDecoration(hintText: "Nhập nội dung công việc"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  // Cập nhật todo
                  todo.todoText = _todoController.text;
                  toDoService.updateToDoItem(todo); // Cập nhật trong service
                });
                _todoController.clear();
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: Text("Lưu"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: Text("Hủy"),
            ),
          ],
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor:
          tdBGColor, // Đảm bảo rằng màu nền giống với màu nền của body
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu, color: tdBlack, size: 30),
            onPressed: () {
              Scaffold.of(context)
                  .openDrawer(); // Mở drawer khi nhấn vào icon menu
            },
          ),
          Expanded(
            child: Text(
              'ToDo List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                  'assets/images/z5454229034776_1d84ce7f2709be82c56d968a422066ef.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
