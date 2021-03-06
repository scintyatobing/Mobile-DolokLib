import 'package:DolokLib/screens/splash/get/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:DolokLib/constants.dart';
import 'package:DolokLib/size_config.dart';
import 'package:get/get.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  controller.updatePage(value);
                },
                itemCount: controller.splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: controller.splashData[index]["image"],
                  text: controller.splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Lanjutkan",
                      press: () {
                        controller.checkHasLogin();
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot({int? index}) {
    return Obx(() {
      return AnimatedContainer(
        duration: kAnimationDuration,
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: controller.currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
          color: controller.currentPage == index
              ? kPrimaryColor
              : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3),
        ),
      );
    });
  }
}
