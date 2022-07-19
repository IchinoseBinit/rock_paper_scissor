import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/screens/lost_screen.dart';
import '/screens/won_screen.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.title,
    required this.image,
    this.isScissor = false,
  }) : super(key: key);

  final String title;
  final String image;
  final bool isScissor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => isScissor ? const WonScreen() : const LostScreen(),
        ),
      ),
      child: Card(
        child: SizedBox(
          width: 140,
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              const SizedBox(
                height: 8,
              ),
              SvgPicture.asset(
                image,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
