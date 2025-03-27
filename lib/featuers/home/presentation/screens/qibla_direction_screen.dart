// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';

import 'dart:math';

class QiblaDirectionScreen extends StatefulWidget {
  const QiblaDirectionScreen({super.key});

  @override
  _QiblaDirectionScreenState createState() => _QiblaDirectionScreenState();
}

class _QiblaDirectionScreenState extends State<QiblaDirectionScreen> {
  double? _qiblaAngle; 

  @override
  void initState() {
    super.initState();
    _calculateQiblaDirection();
  }

  Future<void> _calculateQiblaDirection() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final kaabaLatitude = 21.4225; 
    final kaabaLongitude = 39.8262; 

    final qiblaAngle = calculateQiblaAngle(
      position.latitude,
      position.longitude,
      kaabaLatitude,
      kaabaLongitude,
    );

    setState(() {
      _qiblaAngle = qiblaAngle;
    });
  }

  double calculateQiblaAngle(
    double userLat,
    double userLng,
    double kaabaLat,
    double kaabaLng,
  ) {
    final phiK = radians(kaabaLat);
    final lambdaK = radians(kaabaLng);
    final phi = radians(userLat);
    final lambda = radians(userLng);

    final psi = atan2(sin(lambdaK - lambda),
        cos(phi) * tan(phiK) - sin(phi) * cos(lambdaK - lambda));

    return (degrees(psi) + 360) % 360;
  }

  double radians(double degrees) => degrees * (pi / 180);
  double degrees(double radians) => radians * (180 / pi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اتجاه القبلة",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _qiblaAngle == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "اتجاه القبلة",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildCompass(_qiblaAngle!),
                  SizedBox(height: 20),
                  Text(
                    "${_qiblaAngle!.toStringAsFixed(1)}°",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "قم بتدوير الجهاز نحو هذا الاتجاه",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildCompass(double qiblaAngle) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.2),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: CustomPaint(
            painter: CompassPainter(),
          ),
        ),
        Transform.rotate(
          angle: (qiblaAngle * pi / 180),
          child: Icon(
            Icons.arrow_upward,
            size: 60,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}

class CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    void drawLabel(String label, Offset offset) {
      textPainter.text = TextSpan(
        text: label,
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      );
      textPainter.layout();
      textPainter.paint(canvas, offset);
    }

    drawLabel("N", Offset(center.dx - 10, 10));
    drawLabel("S", Offset(center.dx - 10, size.height - 30));
    drawLabel("E", Offset(size.width - 30, center.dy - 10));
    drawLabel("W", Offset(10, center.dy - 10));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}