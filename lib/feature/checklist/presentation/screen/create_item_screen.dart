import 'package:flutter/material.dart';

class CreateItemScreen extends StatelessWidget {
  const CreateItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Tugas Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Nama Tugas'),
            ),
            // Tambahkan field lainnya seperti deskripsi, kategori, dll.
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyimpan tugas baru
              },
              child: const Text('Tambah Tugas'),
            ),
          ],
        ),
      ),
    );
  }
}
