class Todo {
  final int? id;
  final int begin;
  final int isDone;
  final String name;
  final int deadline;

  const Todo({
    this.id,
    required this.name,
    required this.begin,
    required this.isDone,
    required this.deadline,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'begin': DateTime.now().millisecondsSinceEpoch,
      'isDone': isDone,
      'deadline': deadline,
    };
  }

  @override
  String toString() {
    return '''
Todo{
  id: $id,
  name: $name,
  isDone: $isDone,
  begin: $begin,
  deadline: $deadline,
}
      ''';
  }
}
