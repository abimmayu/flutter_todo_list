import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final DateTime dueDate;
  final int priority;
  final bool isCompleted;

  const ItemDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Deskripsi:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(description),
            const SizedBox(height: 16),
            const Text('Tanggal Jatuh Tempo:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(dueDate.toString()),
            const SizedBox(height: 16),
            const Text('Prioritas:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('$priority'),
            const SizedBox(height: 16),
            const Text('Selesai:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(isCompleted ? 'Ya' : 'Tidak'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text(
                'Kembali',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyelesaikan item
              },
              child: const Text(
                'Selesaikan',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menghapus item
              },
              child: const Text(
                'Hapus',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
