import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do_app/features/task_managemnet/data/firestore_repository.dart';
import '../domain/task.dart';
part 'firestore_controller.g.dart';

@riverpod
class FirestoreController extends _$FirestoreController{
@override
Future<void> build() {
  throw UnimplementedError();
}

Future<void> addTask({required Task task, required String userId}) async {
  state = const AsyncLoading();
  final firestoreRepository = ref.read(firestoreRepositoryProvider);
  state = await AsyncValue.guard(() => firestoreRepository.addTask(task: task, userId: userId));
}

Future<void> updateTask({required Task task, required String userId}) async {
  state = const AsyncLoading();
  final firestoreRepository = ref.read(firestoreRepositoryProvider);
  state = await AsyncValue.guard(() => firestoreRepository.updateTask(task: task, userId: userId));
}

Future<void> deleteTask({required String taskId, required String userId}) async {
  state = const AsyncLoading();
  final firestoreRepository = ref.read(firestoreRepositoryProvider);
  state = await AsyncValue.guard(() => firestoreRepository.deleteTask(taskId: taskId, userId: userId));
}


}


