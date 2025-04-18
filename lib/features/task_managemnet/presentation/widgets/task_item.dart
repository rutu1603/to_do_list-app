
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/features/task_managemnet/presentation/firestore_controller.dart';
import 'package:to_do_app/utils/size_config.dart';

import '../../../../utils/appstyles.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../data/firestore_repository.dart';
import '../../domain/task.dart';


String formertDate(String date){
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat('dd-MMM-yyyy').format(dateTime);
  return formattedDate;
}

class TaskItem extends ConsumerStatefulWidget{
  const TaskItem(this.task, {super.key});

  final Task task;

  @override
  ConsumerState createState() => _TaskItemState();

}
class _TaskItemState extends ConsumerState<TaskItem>{

void _deletTask(String taskId){
  final userId = ref.watch(currentUserProvider)!.uid;
  showDialog(context: context, builder: (ctx) => AlertDialog(
    title: Text(
      'Are you Sure',
      style: AppStyles.normalTextStyle,),
    icon: const Icon(
      Icons.delete,
      color: Colors.red,
      size: 60,
    ),

    alignment: Alignment.center,
    content: const Text('Tap to delete the task!'),
    actions: [
      ElevatedButton(
          onPressed: (){
            context.pop();
          },
          child: Text(
            'Cancel',
            style: AppStyles.normalTextStyle,),),

      ElevatedButton(
          onPressed: () async{
            await ref.read(firestoreControllerProvider.notifier).deleteTask( userId: userId, taskId: taskId);
          },
          child: Text(
            'Delete',
            style: AppStyles.normalTextStyle,),),
    ],
  ),
  );
}

void _updateTask(){
  TextEditingController titleController = TextEditingController(text: widget.task.title);
  TextEditingController descriptionController = TextEditingController(text: widget.task.description);

  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(
          Icons.edit,
          color: Colors.green,
          size: 40,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
        ),
        ),
    TextField(
      controller: descriptionController,
      decoration: const InputDecoration(
        labelText: 'Discription',
      ),
    ),
    ],
  ),
        actions: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  context.pop();
                },
                child: Text('cancel', style: AppStyles.normalTextStyle,),),
            SizedBox(width: SizeConfig.getProportionatinWidht(20)),
            ElevatedButton(
              onPressed: (){
                String newTitle = titleController.text;
                String newDescription = descriptionController.text;
                final userId = ref.read(currentUserProvider)!.uid;
                final newTask = Task(
                    id: widget.task.id,
                    title: newTitle,
                    description: newDescription,
                    priority: widget.task.priority,
                    date: DateTime.now().toString(),
                    isComplete: widget.task.isComplete,
                );
                ref.read(firestoreControllerProvider.notifier).updateTask(
                    task: newTask, userId: userId, );
                context.pop();

              },
              child: Text('Update', style: AppStyles.normalTextStyle,),),
          ],
      )
    ],
  )
  );

}



  @override
  Widget build(BuildContext context){
    SizeConfig.init(context);
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
        widget.task.title,
        style: AppStyles.titleTextStyle.copyWith(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      SizedBox(height: SizeConfig.getProportionatinHeight(20)),
      Text(
        widget.task.description,
        style: AppStyles.titleTextStyle.copyWith(
            color: Colors.white
        ),
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
      SizedBox(height: SizeConfig.getProportionatinHeight(20)),

      Row(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            height: SizeConfig.getProportionatinHeight(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepOrange,
            ),
            child: Text(
              widget.task.priority.toUpperCase(),
              style: AppStyles.normalTextStyle.copyWith(
                color: Colors.white,
              ),
          ),),

          SizedBox(width: SizeConfig.getProportionatinWidht(20)),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            height: SizeConfig.getProportionatinHeight(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.green,
            ),
            child: Row(
              children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.black,
                    size: 20,
                  ) ,
                  Text(
                  formertDate(widget.task.date),
                  style: AppStyles.normalTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
      ],
    ),),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Transform.scale(
                scale: 1.5,
                child:Checkbox(value: widget.task.isComplete,
                    onChanged: (bool? value){
                      if(value == null){
                        return;
                      }else{
                        final userId = ref.watch(currentUserProvider)!.uid;
                        ref
                            .read(firestoreRepositoryProvider)
                            .updateTaskCompletion(
                          userId: userId,
                          taskId: widget.task.id,
                          isComplete: value,
                        );
                      }
                    }) ,
              ),
              GestureDetector(
                onTap: _updateTask,
                child: Container(
                  height: SizeConfig.getProportionatinHeight(50),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _deletTask(widget.task.id);
                },
                child: Container(
                  height: SizeConfig.getProportionatinHeight(50),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),

            ],
          ))
    ]
          ),
    );
  }
}