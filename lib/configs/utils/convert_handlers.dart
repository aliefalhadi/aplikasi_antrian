class ConverHandlers {
  String convertStatusAntrian(String statusCode) {
    if (statusCode == '00') {
      return "Belum datang ke MPP";
    } else if (statusCode == '0') {
      return "Sudah datang di MPP";
    } else if (statusCode == '1') {
      return "Sedang dilayani";
    } else if (statusCode == '3') {
      return "Selesai melakukan pelayanan";
    } else {
      return "Gagal melakukan pelayanan";
    }
  }
}
