import 'package:flutter/material.dart';

class HalamanKonversi extends StatefulWidget {
  @override
  _HalamanKonversiState createState() => _HalamanKonversiState();
}

class _HalamanKonversiState extends State<HalamanKonversi> {
  TextEditingController selectedController = TextEditingController();
  TextEditingController celciusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();
  TextEditingController kelvinController = TextEditingController();
  TextEditingController reamurController = TextEditingController();

  void konversiSuhu() {
    if (selectedController == celciusController) {
      double celcius = double.tryParse(celciusController.text) ?? 0.0;
      double fahrenheit = (celcius * 9 / 5) + 32;
      double kelvin = celcius + 273.15;
      double reamur = celcius * 4 / 5;
      setState(() {
        fahrenheitController.text = fahrenheit.toStringAsFixed(2);
        kelvinController.text = kelvin.toStringAsFixed(2);
        reamurController.text = reamur.toStringAsFixed(2);
      });
    } else if (selectedController == fahrenheitController) {
      double fahrenheit = double.tryParse(fahrenheitController.text) ?? 0.0;
      double celcius = (fahrenheit - 32) * 5 / 9;
      double kelvin = celcius + 273.15;
      double reamur = celcius * 4 / 5;
      setState(() {
        celciusController.text = celcius.toStringAsFixed(2);
        kelvinController.text = kelvin.toStringAsFixed(2);
        reamurController.text = reamur.toStringAsFixed(2);
      });
    } else if (selectedController == kelvinController) {
      double kelvin = double.tryParse(kelvinController.text) ?? 0.0;
      double celcius = kelvin - 273.15;
      double fahrenheit = (celcius * 9 / 5) + 32;
      double reamur = celcius * 4 / 5;
      setState(() {
        celciusController.text = celcius.toStringAsFixed(2);
        fahrenheitController.text = fahrenheit.toStringAsFixed(2);
        reamurController.text = reamur.toStringAsFixed(2);
      });
    } else if (selectedController == reamurController) {
      double reamur = double.tryParse(reamurController.text) ?? 0.0;
      double celcius = reamur * 5 / 4;
      double fahrenheit = (celcius * 9 / 5) + 32;
      double kelvin = celcius + 273.15;
      setState(() {
        celciusController.text = celcius.toStringAsFixed(2);
        fahrenheitController.text = fahrenheit.toStringAsFixed(2);
        kelvinController.text = kelvin.toStringAsFixed(2);
      });
    }
  }

  void tambahAngka(String angka) {
    setState(() {
      selectedController.text += angka;
    });
  }

  void hapusAngka() {
    setState(() {
      if (selectedController.text.isNotEmpty) {
        selectedController.text = selectedController.text.substring(0, selectedController.text.length - 1);
      }
    });
  }

  Widget buildButton(String angka) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF60A5FA)),
      onPressed: () => tambahAngka(angka),
      child: Text(angka, style: TextStyle(fontSize: 24, color: Colors.white)),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () => setState(() => selectedController = controller),
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue, width: 2.5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: Color(0xFF3B82F6),
        title: Center(
          child: Text(
            "Konversi Suhu",
            style: TextStyle(
              fontFamily: 'Cardo',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField('Celcius', celciusController),
            SizedBox(height: 10),
            buildTextField('Fahrenheit', fahrenheitController),
            SizedBox(height: 10),
            buildTextField('Kelvin', kelvinController),
            SizedBox(height: 10),
            buildTextField('Reamur', reamurController),
            SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.']
                    .map((angka) => buildButton(angka)),
                ElevatedButton(
                  onPressed: hapusAngka,
                  child: Text('C', style: TextStyle(fontSize: 24, color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFEF4444)),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: konversiSuhu,
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF10B981)),
              child: Text('Konversi', style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
