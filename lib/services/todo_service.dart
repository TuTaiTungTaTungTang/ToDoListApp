import '../models/todo.dart';

class ToDoService {
  List<ToDo> todosList;

  ToDoService({required this.todosList});

  void handleToDoChange(ToDo todo) {
    todo.isDone = !todo.isDone;
  }

  void deleteToDoItem(String id) {
    todosList.removeWhere((item) => item.id == id);
  }

  void addToDoItem(String toDoText) {
    final newTodo = ToDo(
      id: DateTime.now().toString(), // Generate a unique ID
      todoText: toDoText,
    );
    todosList.add(newTodo);
  }

  List<ToDo> runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      return todosList;
    }
    return todosList
        .where((todo) =>
            todo.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase()))
        .toList();
  }
}
