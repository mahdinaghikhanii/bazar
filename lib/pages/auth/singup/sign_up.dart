import '../login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFEFE),
        appBar: AppBar(
            leading: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, size: 25)),
        )),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF121212),
                          fontSize: 24,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.72,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 50),
                        child: Text(
                          'Create account and choose favorite menu',
                          style: TextStyle(
                            color: Color(0xFFA5A5A5),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                        ),
                      ),
                      inputAndTitle(context),
                      _registerButton(),
                      _haveAccountTextAndButton(context)
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    margin: const EdgeInsets.only(bottom: 40),
                    width: MediaQuery.sizeOf(context).width,
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'By clicking Register, you agree to our ',
                            style: TextStyle(
                              color: Color(0xFFA5A5A5),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms and Data Policy.',
                            style: TextStyle(
                              color: Color(0xFF54408C),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ])));
  }
}

Widget inputAndTitle(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Name',
        style: TextStyle(
          color: Color(0xFF121212),
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        width: MediaQuery.sizeOf(context).width,
        height: 48,
        decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadiusDirectional.circular(8)),
        child: TextField(
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            height: 1.9,
          ),
          maxLines: 1,
          inputFormatters: [
            LengthLimitingTextInputFormatter(30),
          ],
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 14),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(color: Color(0xFFF9F9F9), width: 0.6),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(color: Color(0xFFF9F9F9), width: 0.6),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(color: Color(0xFFF9F9F9), width: 0.6),
            ),
            hintText: "Your name",
            hintStyle: TextStyle(
              color: Color(0xFF94959B),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ),
      const SizedBox(height: 16),
      const Text(
        'Email',
        style: TextStyle(
          color: Color(0xFF121212),
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        width: MediaQuery.sizeOf(context).width,
        height: 48,
        decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadiusDirectional.circular(8)),
        child: TextField(
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            height: 1.9,
          ),
          maxLines: 1,
          inputFormatters: [
            LengthLimitingTextInputFormatter(30),
          ],
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 14),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(color: Color(0xFFF9F9F9), width: 0.6),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(color: Color(0xFFF9F9F9), width: 0.6),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(color: Color(0xFFF9F9F9), width: 0.6),
            ),
            hintText: "Your email",
            hintStyle: TextStyle(
              color: Color(0xFF94959B),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ),
      const SizedBox(height: 16),
      const Text(
        'Password',
        style: TextStyle(
          color: Color(0xFF121212),
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        width: MediaQuery.sizeOf(context).width,
        height: 48,
        decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadiusDirectional.circular(8)),
        child: TextField(
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            height: 1.9,
          ),
          maxLines: 1,
          inputFormatters: [
            LengthLimitingTextInputFormatter(30),
          ],
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility,
                  color: Color(0xFFB8B8B8),
                )),
            contentPadding: const EdgeInsets.only(left: 14),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(color: Color(0xFFF9F9F9), width: 0.6),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(color: Color(0xFFF9F9F9), width: 0.6),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(color: Color(0xFFF9F9F9), width: 0.6),
            ),
            hintText: "Your password",
            hintStyle: const TextStyle(
              color: Color(0xFF94959B),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _registerButton() {
  return Padding(
    padding: const EdgeInsets.only(top: 24, bottom: 24),
    child: SizedBox(
      height: 48,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF54408C)),
          onPressed: () {},
          child: const Center(
              child: Text(
            "Register",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700),
          ))),
    ),
  );
}

Widget _haveAccountTextAndButton(context) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width,
    child: Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: "Have an account?",
            style: TextStyle(
              color: Color(0xFFA5A5A5),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
          ),
          const TextSpan(
            text: ' ',
            style: TextStyle(
              color: Color(0xFF444444),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage())),
            text: 'Sign In',
            style: const TextStyle(
              color: Color(0xFF54408C),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    ),
  );
}
