import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
            ),
          ),
          child: Image.asset('assets/images/onboard_doctor.png'),
        ),
        Positioned(
          bottom: 25,
          left: 0,
          right: 0,
          child: Text(
            'Best Doctor \n  Appointment App',
            textAlign: TextAlign.center,
            style: TextStyles.font32PrimaryBold.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}
