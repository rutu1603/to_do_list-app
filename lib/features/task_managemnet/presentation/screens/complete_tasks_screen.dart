import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/common_wedgets/async_value_ui.dart';

import '../../../../common_wedgets/async_value_widget.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../data/firestore_repository.dart';
import '../../domain/task.dart';
import '../widgets/task_item.dart';

class CompleteTasksScreen extends ConsumerWidget {
  const CompleteTasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userId = ref.watch(currentUserProvider)!.uid;
    final completeTaskAsyncValue = ref.watch(loadCompleteTasksProvider(userId));

    ref.listen<AsyncValue>(loadCompleteTasksProvider(userId), (_, state){
      state.showAlterDialogOnError(context);
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Complete Tasks',

          ),
        ),
        body: AsyncValueWidget<List<Task>>(
            value: completeTaskAsyncValue,
            data: (tasks) {
              return tasks.isEmpty
                  ? const Center(child: Text('No tasks available'))
                  : ListView.separated(

                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskItem(task);
                },
                separatorBuilder: (ctx, height) =>
                const Divider(
                  height: 2,
                  color: Colors.blue,
                ),
                itemCount: tasks.length,
              );
            }
        )
    );
  }
}