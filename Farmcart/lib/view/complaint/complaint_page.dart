import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:farmcart/controller/home_controller.dart';
import 'package:farmcart/utils/common/widget_helper.dart';
import 'package:farmcart/utils/constant/color_const.dart';
import 'package:farmcart/utils/constant/string_const.dart';

class ComplaintPage extends GetView<HomeController> {
  const ComplaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.whiteColor,
      body: createUi(),
    );
  }

  Widget createUi() {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            getAppBarWithBackBtn(title: StringConst.appName),
            Flexible(child: noDataFound())
          ],
        ),
      ],
    );
  }
}
