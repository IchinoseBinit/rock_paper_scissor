import 'package:flutter/material.dart';

import '/constants/string_constant.dart';

class LostScreen extends StatefulWidget {
  const LostScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LostScreen> createState() => _LostScreenState();
}

class _LostScreenState extends State<LostScreen> with TickerProviderStateMixin {
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..addListener(() {
        setState(() {});
      });
    textController.forward();
  }

  late AnimationController textController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: textController.value * 300,
          child: Center(
            child: Text(
              StringConstant.lostString,
              style: TextStyle(
                fontSize: textController.value * 30,
                color: Color.fromRGBO(255, 0, 0, textController.value),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
