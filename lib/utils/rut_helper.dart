// taken from: https://github.com/felcadev/validarRUTDart/blob/master/rut_helper.dart

class RutHelper {
  static String charAt(String subject, int position) {
    if (subject is! String || subject.length <= position || subject.length + position < 0) {
      return '';
    }

    int _realPosition = position < 0 ? subject.length + position : position;

    return subject[_realPosition];
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    try {
      double try_double = double.parse(s);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool check(String rut) {
    if (rut.length > 2) {
      var valor = rut.replaceAll('.', '');

      valor = valor.replaceAll('-', '');

      var cuerpo = valor.substring(0, valor.length - 1);

      var dv = valor.substring(valor.length - 1).toUpperCase();

      if (isNumeric(cuerpo)) {
        rut = cuerpo + '-' + dv;

        if (cuerpo.length < 7) {
          return false;
        }

        var suma = 0;
        var multiplo = 2;

        for (var i = 1; i <= cuerpo.length; i++) {
          var index = multiplo * int.parse(charAt(valor, cuerpo.length - i));

          suma = suma + index;

          if (multiplo < 7) {
            multiplo = multiplo + 1;
          } else {
            multiplo = 2;
          }
        }

        var dvEsperado = 11 - (suma % 11);

        dv = (dv == 'K') ? '10' : dv;
        dv = (dv == '0') ? '11' : dv;

        if (dvEsperado.toString() != dv.toString()) {
          return false;
        }

        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
