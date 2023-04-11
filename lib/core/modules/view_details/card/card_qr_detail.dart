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
          'http://ec2-52-14-59-145.us-east-2.compute.amazonaws.com/media/qr1678958602.6619184.png'),
    );
  }
}
