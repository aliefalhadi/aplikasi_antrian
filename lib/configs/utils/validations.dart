class Validations{
  static String stringNullValidation(String value) {
    if (value.isEmpty) {
      return 'inputan tidak boleh kosong';
    }
    return null;
  }

  static String ulangiPasswordValidation({String valueParent, String value}) {
    if (value.isEmpty) {
      return 'inputan tidak boleh kosong';
    }else if(valueParent != value){
      return 'ulangi password tidak sama';
    }
    return null;
  }

  static String validateOtp(String value){
    if(value.isEmpty){
      return 'Kode harus diisi';
    }else if(value.length<6){
      return 'Kode harus berjumlah 6 karakter';
    }
    return null;
  }
}