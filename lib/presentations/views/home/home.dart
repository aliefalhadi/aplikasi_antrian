import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/themes/app_colors.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/pages/antrian_online.dart';
import 'package:aplikasi_antrian/pages/antrian_online_add.dart';
import 'package:aplikasi_antrian/pages/fasilitas.dart';
import 'package:aplikasi_antrian/providers/antrian_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'instansi.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  // Widget buildHomePage(String title) {
  Widget build(BuildContext context) {

    final pictures = Container(
      // padding: EdgeInsets.all(10),
      child: Image.asset(
        'images/mpp1.jpg',
        width: 360.0,
      ),
    );

    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontFamily: 'Times New Roman',
      letterSpacing: 0.5,
      fontSize: 13,
      height: 2,
    );

    final pictures1 = Container(
      // margin: new EdgeInsets.all(12.0),
      // padding: EdgeInsets.all(10),
      child: Image.asset(
        'images/alur.png',
        width: 380.0,
      ),
    );

    final FirstList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        margin: new EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(10),
        // child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => InstansiScreen()));
                  },
                  child: Image.asset(
                    'images/apartment.png',
                    width: 60.0,
                  ),
                ),
                Text('Instansi'),
              ],
              // },
            ),
            //   ],
            // ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => FasilitasScreen()));
                  },
                  child: Image.asset(
                    'images/library.png',
                    width: 60.0,
                  ),
                ),
                Text('Fasilitas'),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () async{
                    EasyLoading.show(status: 'Loading...',maskType: EasyLoadingMaskType.black,dismissOnTap: false);
                    bool libur = await locator<AntrianProvider>().checkAvailableAntrian();
                    EasyLoading.dismiss();
                    if(libur){
                      Alert(
                        context: context,
                        style: AlertStyle(
                          animationType: AnimationType.fromTop,
                          isCloseButton: false,
                          isOverlayTapDismiss: false,
                          descStyle: TextStyle(fontWeight: FontWeight.bold),
                          descTextAlign: TextAlign.center,
                          animationDuration: Duration(milliseconds: 400),
                          alertBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          titleStyle: TextStyle(
                            color: Colors.black,
                          ),
                          alertAlignment: Alignment.center,
                        ),
                        type: AlertType.info,
                        title: "Maaf, pengambilan nomor antrian saat ini sedang ditutup",
                        desc: null,
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                            radius: BorderRadius.circular(0.0),
                          ),
                        ],
                      ).show();
                    }else{
                      Navigator.of(context).pushNamed(AppRouterStrings.ambilAntrian);
                    }

                  },
                  child: Image.asset(
                    'images/qr.png',
                    width: 60.0,
                  ),
                ),
                Text('Antrian'),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRouterStrings.cekAntrian);
                  },
                  child: Image.asset(
                    'images/list.png',
                    width: 60.0,
                  ),
                ),
                Text('Cek Antrian'),
              ],
            ),
          ],
        ),
      ),
      // ),
    );

    final leftColumn = Container(
      // padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          // titleText,
          pictures,
          pictures1,
          // subTitle,
          // ratings,
          FirstList,
          // SecondList,
        ],
      ),
    );

    return new Scaffold(
      // appBar: AppBar(
      // title: Text(title),
      backgroundColor: Colors.white,
      body: Container(
        child: leftColumn,
      ),
    );
  }
}

// // @override
// // Widget build(BuildContext context) {
// //   return MaterialApp(
// //     title: 'Flutter layout demo',
// //     home: buildHomePage('Antrian Online MPP'),
// //   );
// // }

// //   void tmpFunction() {
// //     @override
// //     Widget build(BuildContext context) {
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(builder: (context) => FasilitasScreen()),
// //       );
// //     }
// //   }
// // }
