import 'package:flutter/material.dart';

class SuhuProvider with ChangeNotifier {
  // Nilai suhu input (dari TextField misalnya)
  double _input = 0.0;

  // Hasil konversi
  double _fahrenheit = 0.0;
  double _kelvin = 0.0;
  double _reamur = 0.0;

  // Getter
  double get input => _input;
  double get fahrenheit => _fahrenheit;
  double get kelvin => _kelvin;
  double get reamur => _reamur;

  // Fungsi untuk update suhu dari celcius
  void updateFromCelcius(double value) {
    _input = value;
    _fahrenheit = (value * 9 / 5) + 32;
    _kelvin = value + 273.15;
    _reamur = value * 4 / 5;
    notifyListeners(); // Beritahu listener bahwa ada perubahan
  }

  // Fungsi reset (optional)
  void reset() {
    _input = 0;
    _fahrenheit = 0;
    _kelvin = 0;
    _reamur = 0;
    notifyListeners();
  }
}
