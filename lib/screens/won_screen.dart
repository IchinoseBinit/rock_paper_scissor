import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/components/paper_painter.dart';
import '/constants/image_constant.dart';
import '/constants/string_constant.dart';

class WonScreen extends StatefulWidget {
  const WonScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WonScreen> createState() => _WonScreenState();
}

class _WonScreenState extends State<WonScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    scissorController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 4,
      ),
    )..addListener(() {
        setState(() {});
        if (scissorController.value == 1) {
          textController.forward();
        }
      });
    textController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..addListener(() {
        setState(() {});
      });
    scissorController.forward();
  }

  @override
  void dispose() {
    scissorController.dispose();
    textController.dispose();
    super.dispose();
  }

  late AnimationController scissorController;
  late AnimationController textController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: scissorController,
              builder: (context, _) {
                if (scissorController.value == 1) {
                  return SizedBox(
                    height: textController.value * 300,
                    child: Center(
                      child: Text(
                        StringConstant.wonString,
                        style: TextStyle(
                          fontSize: textController.value * 40,
                          color:
                              Color.fromRGBO(255, 0, 0, textController.value),
                        ),
                      ),
                    ),
                  );
                }
                return CustomPaint(
                  painter: PaperPainter(scissorController.value),
                  child: Container(
                    height: 400,
                  ),
                );
              },
            ),
            if (scissorController.value != 1 || scissorController.value < 0.2)
              Positioned(
                top: (1 - scissorController.value) * 380,
                left: (MediaQuery.of(context).size.width / 2) - 10,
                child: Transform(
                  transform: Matrix4.identity()
                    ..rotateX(50)
                    ..rotateY(30)
                    ..rotateZ(0),
                  child: SvgPicture.asset(
                    ImageConstant.scissorImage,
                    color: Colors.black,
                    height: 100,
                    width: 50,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
