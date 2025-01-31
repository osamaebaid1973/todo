import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';

class FirebaseHelper {
  static CollectionReference<TaskModel> collectionReference =
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson());
  static CollectionReference<UserModel> collectionReferenceOfUser =
      FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson());
  static addEvent(TaskModel taskModel) {
    taskModel.id = collectionReference.doc().id;
    
    collectionReference.doc(taskModel.id).set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getEvents(String selectedCategory) {
    return selectedCategory == 'all'
        ? collectionReference
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots()
        : collectionReference
            .orderBy('date')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid).where('category',isEqualTo: selectedCategory)
            .snapshots();
  }
  //5TAadJVa9DcQUNaMveu5nTEizUC3

  static deleteEvent(String id) {
    collectionReference.doc(id).delete();
  }

  static updateEvent(TaskModel taskModel) {
    collectionReference.doc(taskModel.id).update(taskModel.toJson());
  }

  static Future<void> createUser(
      String emailAddress, String password, String name,
      {required Function onSuccess,
      required Function onError,
      required Function onLoading}) async {
    onLoading();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      addUser(UserModel(
          id: credential.user!.uid,
          email: emailAddress,
          name: credential.user?.displayName,
          createdAt: DateTime.now().millisecondsSinceEpoch));
      credential.user?.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      onError('Something went wrong');
      print(e);
    }
  }

  static addUser(UserModel userModel) {
    collectionReferenceOfUser.doc(userModel.id).set(userModel);
  }

  static Future<void> login(String emailAddress, String password,
      {required Function onSuccess,
      required Function onError,
      required Function onLoading}) async {
    try {
      onLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError('Please verify your email');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('email or password is incorrect');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('email or password is incorrect');
        print('Wrong password provided for that user.');
      }
    }
  }
}
