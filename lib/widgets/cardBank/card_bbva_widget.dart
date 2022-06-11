import 'package:flutter/material.dart';

class CardCurvoBBVACompras extends StatelessWidget {
  const CardCurvoBBVACompras({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.lightBlueAccent[400],
      child: CustomPaint(
        painter: _CardCurvoPainter(),
      ),
    );
  }
}

class _CardCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.lightBlueAccent[700]!
      ..style = PaintingStyle.fill // .fill .stroke
      ..strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(size.width * 0.6, 0);
    // path.quadraticBezierTo(size.width * 0.99, size.height * 0.5,
    //     size.width * 0.5, size.height * 1);
    path.lineTo(size.width * 0.4, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
