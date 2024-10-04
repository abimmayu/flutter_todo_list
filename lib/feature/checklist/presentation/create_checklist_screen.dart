import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateChecklistScreen extends StatefulWidget {
  const CreateChecklistScreen({super.key});

  @override
  State<CreateChecklistScreen> createState() => _CreateChecklistScreenState();
}

class _CreateChecklistScreenState extends State<CreateChecklistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Checklist Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Nama Checklist'),
            ),
            // Tambahkan field lainnya seperti deskripsi, kategori, dll.
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyimpan checklist baru
              },
              child: const Text('Buat Checklist'),
            ),
          ],
        ),
      ),
    );
  }
}
