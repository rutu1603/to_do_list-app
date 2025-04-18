import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/common_wedgets/async_value_ui.dart';

import '../../../../common_wedgets/async_value_widget.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../data/firestore_repository.dart';
import '../../domain/task.dart';
import '../widgets/task_item.dart';

class IncompleteTasksScreen extends ConsumerWidget{
  const IncompleteTasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userId = ref.watch(currentUserProvider)!.uid;
    final incompleteTaskAsyncValue = ref.watch(loadInCompleteTasksProvider(userId));

    ref.listen<AsyncValue>(loadInCompleteTasksProvider(userId), (_, state){
      state.showAlterDialogOnError(context);
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Incomplete Tasks',

          ),
        ),
        body: AsyncValueWidget<List<Task>>(
            value: incompleteTaskAsyncValue,
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