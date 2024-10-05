import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/routing/router.dart';
import 'package:todo_list/core/utils/colors.dart';
import 'package:todo_list/feature/checklist/domain/entities/checklist.dart';
import 'package:todo_list/feature/checklist/domain/entities/item.dart';
import 'package:todo_list/feature/checklist/presentation/bloc/item/item_bloc.dart';

class ChecklistScreenParam {
  final int checklistId;
  final String checklistName;

  ChecklistScreenParam({
    required this.checklistId,
    required this.checklistName,
  });
}

class ChecklistDetailScreen extends StatefulWidget {
  const ChecklistDetailScreen({
    super.key,
    required this.checklistParam,
  });

  final ChecklistScreenParam checklistParam;

  @override
  State<ChecklistDetailScreen> createState() => _ChecklistDetailScreenState();
}

class _ChecklistDetailScreenState extends State<ChecklistDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.checklistParam.checklistName),
      ),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          } else if (state is ItemError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is AllItemLoaded) {
            final items = state.items;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(items[index].name),
                  value: false, // Ganti dengan nilai sebenarnya dari database
                  onChanged: (value) {
                    context.pushNamed(AppRoute.detailItemScreen.name);
                  },
                );
              },
            );
          }
          return Container();
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.pushNamed(AppRoute.createItemScreen.name);
        },
        child: const Text(
          '+ Item',
          style: TextStyle(
            color: AppColor.darkColor,
          ),
        ),
      ),
    );
  }
}
