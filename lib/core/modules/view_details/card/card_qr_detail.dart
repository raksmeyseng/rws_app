import 'package:flutter/material.dart';

class CardQRDetail extends StatefulWidget {
  const CardQRDetail({Key? key}) : super(key: key);

  @override
  State<CardQRDetail> createState() => _CardQRDetailState();
}

class _CardQRDetailState extends State<CardQRDetail> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
          'http://18.222.12.231/media/qr1681033557.780248.png'),
    );
  }
}
