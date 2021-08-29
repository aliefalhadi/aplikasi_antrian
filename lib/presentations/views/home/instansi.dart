import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:aplikasi_antrian/pages/account.dart';
import 'package:aplikasi_antrian/pages/notifikasi.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/instansi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'home.dart';
import 'history.dart';
import 'package:aplikasi_antrian/presentations/views/home/home_app.dart';
import 'package:aplikasi_antrian/url_launcher.dart';

class InstansiScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseView<InstansiProvider>(
      onModelReady: (model)=>model.getDaftarInstansi(),
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Daftar Instansi'),
          ),
          body: Container(
            child:
            provider.state == ViewState.Fetching ?
                Center(child: CircularProgressIndicator(),)
                :
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Daftar Instansi yang ada di MPP Kota Pekanbaru',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontFamily: "Serif"),
                  ),),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      itemCount: provider.daftarAllInstansiModel.data.length,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, AppRouterStrings.detailInstansi, arguments: provider.daftarAllInstansiModel.data[index].instansiId.toString());
                        },
                        child: Container(
                            child: Column(
                              children: [
                                Container(
                                    height: 150,
                                    child: Image.network('http://antrian-mpp.aiiviii.biz.id/images/'+provider.daftarAllInstansiModel.data[index].instansiLogo, fit: BoxFit.fitWidth,)),
                                vSpace(8),
                                Text(provider.daftarAllInstansiModel.data[index].instansiNama, textAlign: TextAlign.center, maxLines: 2,)
                              ],
                            )),
                      ),
                      staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, 2),
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 4.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

