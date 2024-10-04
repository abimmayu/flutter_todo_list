import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/routing/router.dart';
import 'package:todo_list/core/utils/colors.dart';

class ChecklistDetailScreen extends StatefulWidget {
  const ChecklistDetailScreen({
    super.key,
    required this.checklistTitle,
    required this.items,
  });

  final String checklistTitle;
  final List<String> items;

  @override
  State<ChecklistDetailScreen> createState() => _ChecklistDetailScreenState();
}

class _ChecklistDetailScreenState extends State<ChecklistDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.checklistTitle),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(widget.items[index]),
            value: false, // Ganti dengan nilai sebenarnya dari database
            onChanged: (value) {
              context.pushNamed(AppRoute.detailItemScreen.name);
            },
          );
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
