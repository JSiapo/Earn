import 'package:flutter/material.dart';

class CardCurvoBCPCredimas extends StatelessWidget {
  const CardCurvoBCPCredimas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.orange[900],
      child: CustomPaint(
        painter: _CardCurvoPainter(),
      ),
    );
  }
}

class _CardCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Colors.blue[900]!;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(size.width * 0.8, 0.05);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.5,
        size.width * 0.5, size.height * 1);
    path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
