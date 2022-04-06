import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';



class Qrcode extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Qrcode Genrator'),),

      body: Column(
        children: [
          QrImage(
            data: '8492890787',
            version: QrVersions.auto,
            size: 320,
            gapless: false,
            embeddedImage: AssetImage('assets/images/my_embedded_image.png'),
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: Size(80, 80),
            ),
          ),
        ],
      ),
    );
  }
}
