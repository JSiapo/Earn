import 'package:flutter/material.dart';

class CardCurvoBBVADebit extends StatelessWidget {
  const CardCurvoBBVADebit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 168, 186, 1),
              Color.fromRGBO(2, 192, 214, 1),
            ]),
      ),
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

    paint.shader = const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromRGBO(0, 168, 186, 1),
          Color.fromRGBO(2, 192, 214, 1),
        ]).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
