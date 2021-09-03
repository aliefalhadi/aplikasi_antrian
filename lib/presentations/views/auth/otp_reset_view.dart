import 'dart:async';
import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/themes/app_colors.dart';
import 'package:aplikasi_antrian/configs/utils/validations.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/presentations/widgets/custom_button.dart';
import 'package:aplikasi_antrian/providers/auth/ResetPasswordProvider.dart';
import 'package:aplikasi_antrian/providers/auth/register_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpResetView extends StatefulWidget {
  final String noHp;
  const OtpResetView({Key key, this.noHp }) : super(key: key);
  @override
  _OtpResetViewState createState() => _OtpResetViewState();
}

class _OtpResetViewState extends State<OtpResetView> {
  Timer _timer;
  int _start = 59;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  TextEditingController otp = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ResetPasswordProvider>(
      onModelReady: (model) =>
          model.sendCode(widget.noHp, context: context),
      builder: (context, provider, _) => Scaffold(
        appBar: AppBar(
          title: Text('Kode Verifikasi',),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/reset-password.png',height: 200,width: 200,),
              Text(
                  'Kode verifikasi sudah dikirimkan ke ${provider.phoneNumber}'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _form,
                  child: PinCodeTextField(
                    onChanged: (value){},
                    appContext: context,
                    length: 6,
                    validator: (value) =>
                        Validations.validateOtp(value),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: otp,
                    autoDisposeControllers: false,
                    autovalidateMode: AutovalidateMode.disabled,
                    keyboardType: TextInputType.number,
                    cursorColor: primaryColor,
                    pinTheme: PinTheme(
                      selectedColor: primaryColor,
                      inactiveColor: Colors.grey[300],
                      activeColor: primaryColor,
                    ),
                  ),
                ),
              ),
              _timer.isActive
                  ? Text('0:$_start')
                  : RichText(
                text: TextSpan(
                  text: 'Belum menerima kode?',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                  children: [
                    TextSpan(
                        text: ' Kirim Ulang',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              provider.sendCode(widget.noHp, context: context)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  label: "Verifikasi",
                  onPressed: () async {
                    if (_form.currentState.validate()) {
                      EasyLoading.show(status:'Loading',dismissOnTap: false);
                      bool res = await provider.validationOtp(
                          verificationId: provider.verificationId,
                          otp: otp.text
                      );
                      EasyLoading.dismiss();
                      if(res){
                        Navigator.pushReplacementNamed(context, AppRouterStrings.resetPassword);
                      }else{
                        EasyLoading.showError('Kode yang anda masukkan salah');
                      }
                    }
                  },
                  color: primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}