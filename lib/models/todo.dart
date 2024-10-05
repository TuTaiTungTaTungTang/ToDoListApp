class ToDo {
  String id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Hhahahah', isDone: true),
      ToDo(id: '02', todoText: 'hhihihihih', isDone: true),
      ToDo(
        id: '03',
        todoText: 'huhuhuhu',
      ),
      ToDo(
        id: '04',
        todoText: 'tú tài ',
      ),
      ToDo(
        id: '05',
        todoText: 'văn mặn',
      ),
      ToDo(
        id: '06',
        todoText: 'làm binesg',
      ),
    ];
  }
}
