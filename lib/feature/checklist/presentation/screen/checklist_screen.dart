import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/routing/router.dart';
import 'package:todo_list/core/utils/colors.dart';
import 'package:todo_list/feature/checklist/presentation/bloc/checklist/checklist_bloc.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tugas'),
      ),
      body: BlocBuilder<ChecklistBloc, ChecklistState>(
        builder: (context, state) {
          if (state is ChecklistLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          }

          if (state is ChecklistError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is ChecklistLoaded) {
            final data = state.data;
            return ListView.builder(
              itemCount:
                  data.length, // Ganti dengan jumlah tugas yang sebenarnya
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.pushNamed(AppRoute.detailChecklistScreen.name);
                  },
                  child: ListTile(
                    title: Text(data[index].name),
                    trailing: SizedBox(
                      width: 100.w,
                      child: Row(
                        children: [
                          Checkbox(
                            value: data[index].checlistCompletionStatus,
                            onChanged: (value) {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<ChecklistBloc>().add(
                                    DeleteChecklist(data[index].id),
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.pushNamed(AppRoute.createChecklistScreen.name);
        },
        child: const Text(
          '+',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
