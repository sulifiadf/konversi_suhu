import 'package:flutter/material.dart';

class HalamanKonversi extends StatefulWidget {
  @override
  _HalamanKonversiState createState() => _HalamanKonversiState();
}

class _HalamanKonversiState extends State<HalamanKonversi> {
  TextEditingController celciusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();
  TextEditingController kelvinController = TextEditingController();
  TextEditingController reamurController = TextEditingController();

  void konversiSuhu() {
    double celcius = double.tryParse(celciusController.text) ?? 0.0;
    double fahrenheit = (celcius * 9 / 5) + 32;
    double kelvin = celcius + 273.15;
    double reamur = celcius * 4 / 5;

    setState(() {
      fahrenheitController.text = fahrenheit.toStringAsFixed(2);
      kelvinController.text = kelvin.toStringAsFixed(2);
      reamurController.text = reamur.toStringAsFixed(2);
    });
  }

  void tambahAngka(String angka) {
    celciusController.text += angka;
  }

  void hapusAngka() {
    if (celciusController.text.isNotEmpty) {
      celciusController.text =
          celciusController.text.substring(0, celciusController.text.length - 1);
    }
  }

  Widget buildButton(String angka) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF60A5FA),
      ),
      onPressed: () => setState(() => tambahAngka(angka)),
      child: Text(angka, style: TextStyle(fontSize: 24, color: Colors.white)),
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
            TextField(
              controller: celciusController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Celcius',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: fahrenheitController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Fahrenheit',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: kelvinController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Kelvin',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: reamurController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Reamur',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', 'C']
                    .map((angka) => angka == 'C'
                        ? ElevatedButton(
                            onPressed: () => setState(() => hapusAngka()),
                            child: Text('C',
                                style:
                                    TextStyle(fontSize: 24, color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFEF4444),
                            ),
                          )
                        : buildButton(angka))
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: konversiSuhu,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF10B981),
              ),
              child: Text(
                'Konversi',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
