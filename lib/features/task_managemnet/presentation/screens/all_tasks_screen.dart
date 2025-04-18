import'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/common_wedgets/async_value_ui.dart';

import '../../../../common_wedgets/async_value_widget.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../data/firestore_repository.dart';
import '../../domain/task.dart';
import '../widgets/task_item.dart';



class AllTasksScreen extends ConsumerStatefulWidget{
  const AllTasksScreen({super.key});

  @override
  ConsumerState createState() => _AllTasksScreenState();
}

  class _AllTasksScreenState extends ConsumerState<AllTasksScreen> {
    @override
    Widget build(BuildContext context) {
      final userId = ref.watch(currentUserProvider)!.uid;
      final taskAsyncValue = ref.watch(loadTasksProvider(userId));

      ref.listen<AsyncValue>(loadTasksProvider(userId), (_, state){
        state.showAlterDialogOnError(context);
      });

      return Scaffold(
          appBar: AppBar(
          title: Text(
            'My Tasks',

          ),
      ),
      body: AsyncValueWidget<List<Task>>(
      value: taskAsyncValue,
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