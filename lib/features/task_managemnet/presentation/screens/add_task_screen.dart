import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/common_wedgets/async_value_ui.dart';
import 'package:to_do_app/features/authentication/data/auth_repository.dart';
import 'package:to_do_app/features/task_managemnet/presentation/widgets/title_discription.dart';

import '../../../../utils/appstyles.dart';
import '../../../../utils/appstyles.dart';
import '../../../../utils/size_config.dart';
import '../../domain/task.dart';
import '../firestore_controller.dart';

class AddTaskScreen extends ConsumerStatefulWidget{
  const AddTaskScreen({super.key});

  @override
  ConsumerState createState() => _AddTaskScreenState();

}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen>{
  
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<String> _priorityList = ['High', 'Medium', 'Low'];
  int _selectedPriorityIndex = 0;

  @override
  void dispose(){
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    SizeConfig.init(context);

    final user = ref.watch(currentUserProvider);
    if (user == null) {
      return const Center(child: Text("User not logged in"));
    }
    final userId = user.uid;

    final state = ref.watch(firestoreControllerProvider);

    ref.listen(firestoreControllerProvider, (_, state) {
      state.showAlterDialogOnError(context);
    });


    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Task',
          style: AppStyles.titleTextStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Column(
          children: [
            TitleDescription(title: 'Task Title',
                prefixIcon: Icons.notes,
                hintText: 'Enter task Title',
                maxLines: 1,
                controller: _titleController),
            SizedBox(height: SizeConfig.getProportionatinWidht(10)),
            TitleDescription(title: 'Task Description',
                prefixIcon: Icons.description,
                hintText: 'Enter task Description',
                maxLines: 1,
                controller: _descriptionController),

            SizedBox(height: SizeConfig.getProportionatinWidht(20)),

            Row(children: [
              Text(
                'Priority',
                style: AppStyles.headingTextStyle.copyWith(
                  fontSize: SizeConfig.getProportionatinHeight(20),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: SizeConfig.getProportionatinHeight(80),
                  child: ListView.builder(
                    itemCount: _priorityList.length, // Changed from _selectedPriorityIndex
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      final priority = _priorityList[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPriorityIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: SizeConfig.getProportionatinWidht(10)),
                          padding: EdgeInsets.all(SizeConfig.getProportionatinWidht(10)),
                          alignment: Alignment.center, // fixed typo
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _selectedPriorityIndex == index // fixed
                                ? Colors.green
                                : Colors.grey,
                          ),
                          child: Text(
                            priority,
                            style: AppStyles.normalTextStyle.copyWith(
                              fontSize: SizeConfig.getProportionatinHeight(20.0),
                              color: _selectedPriorityIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

            ],
        ),
        SizedBox(height: SizeConfig.getProportionatinWidht(20)), // fixed from SizeBox
        InkWell( // fixed from Inkwell
          onTap: () {
            final title = _titleController.text.trim();
            final description = _descriptionController.text.trim();
            String priority = _priorityList[_selectedPriorityIndex];
            String date = DateTime.now().toString();

            final myTask = Task(
              title: title,
              description: description,
              priority: priority,
              date: date,

            );
            ref.read(firestoreControllerProvider.notifier).addTask(task: myTask, userId: userId);
          },
          child: Container(
            alignment: Alignment.center, // fixed from Alingment
            height: SizeConfig.getProportionatinHeight(50), // proper height
            width: double.infinity, // full width button
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: state.isLoading? const CircularProgressIndicator(color: Colors.white,) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                SizedBox(width: SizeConfig.getProportionatinWidht(10)),
                Text(
                  'Add Task',
                  style: AppStyles.normalTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        ]
        )
      ),
    );
  }
}

