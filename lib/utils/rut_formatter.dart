import 'package:flutter/services.dart';

class RutFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedRut = '';
    switch (newValue.text.length) {
      case (4):
        formattedRut = newValue.text.replaceAll('.', '');
        formattedRut = formattedRut[0] + '.' + formattedRut.substring(1, formattedRut.length);
        break;
      case (6):
        formattedRut = newValue.text.replaceAll('.', '');
        formattedRut =
            formattedRut.substring(0, 2) + '.' + formattedRut.substring(2, formattedRut.length);
        break;
      case (7):
        formattedRut = newValue.text.replaceAll('.', '');
        formattedRut =
            formattedRut.substring(0, 3) + '.' + formattedRut.substring(3, formattedRut.length);
        break;
      case (8):
        if (newValue.text.length > oldValue.text.length) {
          formattedRut = newValue.text.replaceAll('.', '');
          formattedRut = formattedRut[0] +
              '.' +
              formattedRut.substring(1, 4) +
              '.' +
              formattedRut.substring(4, formattedRut.length);
        } else {
          formattedRut = newValue.text;
          formattedRut = formattedRut.substring(0, formattedRut.length);
        }
        break;
      case (9):
        if (newValue.text.length > oldValue.text.length) {
          formattedRut = newValue.text.replaceAll('.', '');
          formattedRut = formattedRut.replaceAll('-', '');
          formattedRut = formattedRut[0] +
              '.' +
              formattedRut.substring(1, 4) +
              '.' +
              formattedRut.substring(4, formattedRut.length - 1) +
              '-' +
              formattedRut[formattedRut.length - 1];
        } else {
          formattedRut = newValue.text;
          formattedRut = formattedRut.substring(0, formattedRut.length);
        }
        break;
      case (10):
        if (newValue.text.length > oldValue.text.length) {
          formattedRut = newValue.text.replaceAll('.', '');
          formattedRut = formattedRut.replaceAll('-', '');
          formattedRut = formattedRut[0] +
              '.' +
              formattedRut.substring(1, 4) +
              '.' +
              formattedRut.substring(4, formattedRut.length - 1) +
              '-' +
              formattedRut[formattedRut.length - 1];
        } else {
          formattedRut = newValue.text;
          formattedRut = formattedRut.substring(0, formattedRut.length);
        }

        break;
      case (12):
        formattedRut = newValue.text.replaceAll('.', '');
        formattedRut = formattedRut.replaceAll('-', '');
        formattedRut = formattedRut.substring(0, 2) +
            '.' +
            formattedRut.substring(2, 5) +
            '.' +
            formattedRut.substring(5, formattedRut.length - 1) +
            '-' +
            formattedRut[formattedRut.length - 1];
        break;
      default:
        if (newValue.text.length > oldValue.text.length) {
          formattedRut = newValue.text.replaceAll('.', '');
        } else {
          formattedRut = newValue.text;
          if (formattedRut.length > 1) {
            formattedRut = formattedRut.substring(0, formattedRut.length);
          } else {
            formattedRut = "";
          }
        }
        break;
    }

    return TextEditingValue(
        text: formattedRut,
        selection: TextSelection.fromPosition(TextPosition(offset: formattedRut.length)));
  }
}
