import 'package:flutter/material.dart';

import '/components/option_card.dart';
import '/constants/option_constant.dart';
import '/constants/string_constant.dart';

class ChooseOptionScreen extends StatelessWidget {
  const ChooseOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringConstant.welcomeString,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.red,
                    letterSpacing: 2,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              StringConstant.chooseString,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: OptionConstant.list
                  .map(
                    (e) => OptionCard(
                      title: e["title"].toString(),
                      image: e["image"].toString(),
                      isScissor: e["isScissor"] as bool,
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
