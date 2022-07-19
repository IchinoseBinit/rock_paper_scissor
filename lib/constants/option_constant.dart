import 'package:rock_paper_scissor/constants/string_constant.dart';

import '/constants/image_constant.dart';

class OptionConstant {
  static const list = [
    {
      "title": StringConstant.rockString,
      "image": ImageConstant.fistImage,
      "isScissor": false,
    },
    {
      "title": StringConstant.scissorString,
      "image": ImageConstant.scissorImage,
      "isScissor": true,
    }
  ];
}
