import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/task.dart';

part 'firestore_repository.g.dart';

class FirestoreRepository{
  FirestoreRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Future<void> addTask({required Task task, required String userId}) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .add(task.toMap());
    await docRef.update({'id': docRef.id});
  }

  Future<void> updateTask({required Task task, required String userId}) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(task.id)
        .update(task.toMap());
    }


  Stream<List<Task>> loadTasks(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .orderBy('date', descending: true)
        .snapshots()
        .map((querySnapshot) {
      print("Snapshot has ${querySnapshot.docs.length} docs");

      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        print("Doc data: $data");
        return Task.fromMap(data);
      }).toList();
    });

  }



  Stream<List<Task>> loadCompleteTasks(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .orderBy('date',descending: true)
        .where('isComplete', isEqualTo: true)
        .snapshots()
        .map((querySnapshot) =>
        querySnapshot.docs.map((doc) => Task.fromMap(doc.data())).toList());
  }

  Stream<List<Task>> loadInCompleteTasks(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .orderBy('date',descending: true)
        .where('isComplete', isEqualTo: false)
        .snapshots()
        .map((querySnapshot) =>
        querySnapshot.docs.map((doc) => Task.fromMap(doc.data())).toList());
  }

  Future<void> deleteTask({required String taskId, required String userId}) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }

  Future<void> updateTaskCompletion(
      { required String taskId,
        required bool isComplete,
        required String userId}) async {
        await _firestore
            .collection('users')
            .doc(userId)
            .collection('tasks')
            .doc(taskId)
            .update({'isComplete': isComplete});
  }
}

@Riverpod(keepAlive: true)
FirestoreRepository firestoreRepository(Ref ref) {
  return FirestoreRepository(FirebaseFirestore.instance);

}




@riverpod
Stream<List<Task>> loadTasks(Ref ref, String userId)

{
  final firestoreRepository = ref.watch(firestoreRepositoryProvider);
  return firestoreRepository.loadTasks(userId);
}

@riverpod
Stream<List<Task>> loadCompleteTasks(Ref ref, String userId)

{
  final firestoreRepository = ref.watch(firestoreRepositoryProvider);
  return firestoreRepository.loadCompleteTasks(userId);
}


@riverpod
Stream<List<Task>> loadInCompleteTasks(Ref ref, String userId)

{
  final firestoreRepository = ref.watch(firestoreRepositoryProvider);
  return firestoreRepository.loadInCompleteTasks(userId);
}