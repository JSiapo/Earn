import 'package:flutter/material.dart';

class CardCurvoCMRDebito extends StatelessWidget {
  const CardCurvoCMRDebito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromRGBO(86, 88, 90, 1),
      child: CustomPaint(
        painter: _CardCurvoPainter(),
      ),
    );
  }
}

class _CardCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white30
      ..style = PaintingStyle.stroke // .fill .stroke
      ..strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.moveTo(size.width * 0.6, 0);
    path.quadraticBezierTo(
        size.width * 0.65, size.height * 0.5, size.width, size.height * 0.6);
    path.moveTo(size.width, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.15, size.height * 0.6, size.width * 0.5, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
