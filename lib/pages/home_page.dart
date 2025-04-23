import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/suhu_provider.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final suhuProvider = Provider.of<SuhuProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi Suhu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input suhu
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan suhu (°C)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Tombol konversi
            ElevatedButton(
              onPressed: () {
                double input = double.tryParse(_controller.text) ?? 0.0;
                suhuProvider.updateFromCelcius(input);
              },
              child: const Text('Konversi'),
            ),
            const SizedBox(height: 24),

            // Hasil konversi
            ResultCard(label: 'Fahrenheit (°F)', value: suhuProvider.fahrenheit),
            ResultCard(label: 'Kelvin (K)', value: suhuProvider.kelvin),
            ResultCard(label: 'Reamur (°Re)', value: suhuProvider.reamur),

            const SizedBox(height: 24),

            // Tombol reset (opsional)
            ElevatedButton(
              onPressed: () {
                _controller.clear();
                suhuProvider.reset();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final String label;
  final double value;

  const ResultCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(label),
        trailing: Text(value.toStringAsFixed(2)),
      ),
    );
  }
}
