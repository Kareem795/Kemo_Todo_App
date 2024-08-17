import 'package:cloud_firestore/cloud_firestore.dart';

class Todo_DM
{
  static const String collection_name = "todo";
  late String id;
  late String title;
  late DateTime date;
  late String description;
  late bool isDone;

  Todo_DM
  (
    {
      required this.id, 
      required this.title, 
      required this.date, 
      required this.description, 
      required this.isDone
    }
  );

  Todo_DM.fromJson(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    description = json["description"];
    Timestamp timestamp = json["date"];
    date = timestamp.toDate();
    isDone = json["isDone"];
  }

  Map<String , dynamic> to_json () => {
      "id":id,
      "title":title,
      "description":description,
      "date":title,
      "isDone":isDone
    };


}