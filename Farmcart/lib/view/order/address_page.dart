import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:farmcart/controller/home_controller.dart';
import 'package:farmcart/utils/common/widget_helper.dart';
import 'package:farmcart/utils/constant/color_const.dart';
import 'package:farmcart/utils/constant/string_const.dart';

class AddressPage extends GetView<HomeController> {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConst.whiteColor,
      body: createUi(size),
    );
  }

  Widget createUi(Size size) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            getAppBarWithBackBtn(title: StringConst.manageAddress),
            Flexible(child: noDataFound())
          ],
        ),
      ],
    );
  }
}
