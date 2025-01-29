class TaskModel {
  String title;
  String description;
  int date;
  bool isDone;
  String category;
  
 
  String id;
 TaskModel({
   required this.title,
   required this.description,
   required this.date,
    this.id='',
   this.isDone = false,
   required this.category
 }); 
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      description: json['description'],
      date: json['date'],
      id: json['id'],
      isDone:json['isDone'],
      category: json['category']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'id': id,
      'isDone': isDone,
      'category': category
    };
  }
}