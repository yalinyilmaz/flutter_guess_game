import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Yeni değer boşsa, boş bir string döndür
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Sadece sayıları kabul et
    final numericValue = int.tryParse(newValue.text);
    if (numericValue == null) {
      return oldValue;
    }

    // 0-101 aralığında sınırla
    final limitedValue = numericValue.clamp(1, 100);

    // Yeni değeri string'e çevir
    final formattedValue = limitedValue.toString();

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}

