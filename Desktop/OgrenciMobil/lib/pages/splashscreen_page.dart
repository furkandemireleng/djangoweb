import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key key}) : super(key: key);

  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorDark, colorSecondary],
            begin: Alignment(-1.0, -1.0),
            end: Alignment(1.0, 1.0),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                appImagesFolder + 'logo.png',
                width: MediaQuery.of(context).size.width - 60,
              ),
              SizedBox(
                height: 40,
              ),
              CircularProgressIndicator(
                backgroundColor: colorDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
