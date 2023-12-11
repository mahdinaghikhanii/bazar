import 'package:bazar/common/routes/routes.dart';
import 'package:bazar/common/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'index.dart';

class VerificationPage extends GetView<VerificationController> {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationController>(builder: (_) {
      return Scaffold(
          bottomNavigationBar: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: Get.width,
              height: 50,
              child: Obx(
                () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            controller.state.subtitleTextStyle.value ==
                                    "Verified"
                                ? const Color(0xFF54408C)
                                : Colors.grey),
                    onPressed: () {
                      if (controller.state.subtitleTextStyle.value ==
                          "Verified") {
                        Get.toNamed(AppRoutes.congratulation);
                      } else {
                        CustomSnackbar.show(
                            title: "Warning", message: "Please enter code");
                      }
                    },
                    child: const Text("Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16))),
              ),
            ),
          )),
          backgroundColor: const Color(0xFFFFFEFE),
          appBar: AppBar(
              leading: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, size: 25)),
          )),
          body: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                titleAndDiscriptionAboutVerification(),
                inputCode(context, controller),
                resendCode()
              ]),
            ),
          ));
    });
  }
}

Widget titleAndDiscriptionAboutVerification() {
  return const Column(children: [
    Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: Text(
          'Verification Email',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF121212),
            fontSize: 24,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w700,
            height: 0.06,
            letterSpacing: -0.72,
          ),
        ),
      ),
    ),
    Text(
      'Please enter the code we just sent to email ',
      style: TextStyle(
        color: Color(0xFFA5A5A5),
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    ),
    Text(
      'mahdinaghikhani@gmail.com',
      style: TextStyle(
        color: Color(0xFF121212),
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    )
  ]);
}

Widget inputCode(context, VerificationController controller) {
  return Center(
      child: Container(
    padding: const EdgeInsets.only(top: 50, bottom: 24, right: 60, left: 60),
    child: Column(
      children: [
        PinCodeTextField(
          appContext: context,
          length: 4,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(12),
            fieldHeight: 64,
            fieldWidth: 57,
            activeFillColor: Colors.white,
            borderWidth: 1,
            activeColor: Get.theme.focusColor,
            inactiveColor: const Color(0xFFD8DADC),
            selectedColor: Colors.black,
            errorBorderColor: const Color(0xffFF5959),
          ),
          cursorColor: Get.theme.focusColor,
          autoDisposeControllers: true,
          autoDismissKeyboard: true,
          keyboardType: TextInputType.number,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: false,
          autoFocus: false,
          errorAnimationController: controller.errorController,
          controller: controller.smsTextController,
          onCompleted: (v) {
            controller.authUpdate(submitted: v, type: v);
          },
          onChanged: (value) {},
          beforeTextPaste: (text) {
            return true;
          },
        ),
        Center(
          child: GetBuilder<VerificationController>(
              id: 'subtitleTextType',
              builder: (controller) {
                return controller
                    .subtitleTextType(controller.state.subtitleTextStyle.value);
              }),
        ),
      ],
    ),
  ));
}

Widget resendCode() {
  return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'If you didn’t receive a code? ',
          style: TextStyle(
            color: Color(0xFFA5A5A5),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {},
            child: const Text(
              'Resend',
              style: TextStyle(
                color: Color(0xFF54408C),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ))
      ]);
}
