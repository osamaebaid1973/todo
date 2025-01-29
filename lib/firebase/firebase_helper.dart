import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task_model.dart';

class FirebaseHelper {
  static CollectionReference<TaskModel> collectionReference = FirebaseFirestore.instance
        .collection('tasks')
        .withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromJson(snapshot.data()!),
            toFirestore: (value, _) => value.toJson());
  static addEvent(TaskModel taskModel) {
    
            taskModel.id = collectionReference.doc().id;
            collectionReference.doc(taskModel.id).set(taskModel);
        
  }
  static Stream<QuerySnapshot<TaskModel>>  getEvents() {
    return  collectionReference.snapshots();
    

  }
  static deleteEvent(String id) {
    collectionReference.doc(id).delete();
  }
  static updateEvent(TaskModel taskModel) {
    collectionReference.doc(taskModel.id).update(taskModel.toJson());
  }
}
