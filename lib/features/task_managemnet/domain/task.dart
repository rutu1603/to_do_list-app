import 'package:cloud_firestore/cloud_firestore.dart';

class Task{
  final String id ;
  final String title;
  final String description;
  final String priority ;
  final String date;
  final bool isComplete;

//<editor-fold desc="Data Methods">


  const Task({
    this.id='',
    required this.title,
    required this.description,
    required this.priority,
    required this.date,
     this.isComplete =false,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Task &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              description == other.description &&
              priority == other.priority &&
              date == other.date &&
              isComplete == other.isComplete
          );


  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      priority.hashCode ^
      date.hashCode ^
      isComplete.hashCode;


  @override
  String toString() {
    return 'Task{' +
        ' id: $id,' +
        ' title: $title,' +
        ' description: $description,' +
        ' priority: $priority,' +
        ' date: $date,' +
        ' isComplete: $isComplete,' +
        '}';
  }


  Task copyWith({
    bool? isComplete,
  }) {
    return Task(
      id: id,
      title: title,
      description: description,
      priority: priority,
      date: date,
      isComplete: isComplete ?? this.isComplete,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'priority': this.priority,
      'date': this.date,
      'isComplete': this.isComplete,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      priority: map['priority'] as String,
      date: map['date'] as String,
      isComplete: map['isComplete'] as bool,
    );
  }


//</editor-fold>
}