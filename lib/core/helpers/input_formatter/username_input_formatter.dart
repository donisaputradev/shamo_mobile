import 'package:flutter/services.dart';

class UsernameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Mengecek apakah nilai baru null atau kosong
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Mengubah semua karakter menjadi huruf kecil (lowercase)
    String newText = newValue.text.toLowerCase();

    // Mengecek setiap karakter baru untuk menghindari karakter spesial
    for (int i = 0; i < newText.length; i++) {
      String char = newText[i];
      if (!_isAlphaNumeric(char)) {
        // Karakter spesial ditemukan, jadi kita menghapusnya
        newText = newText.replaceRange(i, i + 1, '');
      }
    }

    // Mengembalikan nilai baru yang sudah diformat
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }

  bool _isAlphaNumeric(String char) {
    // Menggunakan regex untuk memeriksa apakah karakter adalah huruf atau angka
    final alphaNumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    return alphaNumericRegex.hasMatch(char);
  }
}
