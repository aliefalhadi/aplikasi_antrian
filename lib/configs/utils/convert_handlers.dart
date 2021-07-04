class ConverHandlers{
  String convertStatusAntrian(String statusCode){
    if(statusCode == '0'){
      return "Belum Scan";
    }else if(statusCode == '1'){
      return "Sudah Scan";
    }else if(statusCode == '3'){
      return "Selesai";
    }else{
      return "Gagal";
    }
  }
}