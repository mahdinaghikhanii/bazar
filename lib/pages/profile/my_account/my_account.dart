import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../common/constans/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountPages extends StatefulWidget {
  const MyAccountPages({super.key});

  @override
  State<MyAccountPages> createState() => _MyAccountPagesState();
}

class _MyAccountPagesState extends State<MyAccountPages> {
  File? _image;
  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text('My Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF121212),
                fontSize: 20,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                height: 0.07,
              )),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: _image == null
                      ? Image.asset(
                          Images.personIcon,
                          width: 100,
                          height: 100,
                        )
                      : Image.file(_image!,
                          width: 100, height: 100, fit: BoxFit.cover))),
          const SizedBox(height: 2),
          TextButton(
              onPressed: () => _getImage(),
              child: const Text('Change Picture',
                  style: TextStyle(
                      color: Color(0xFF54408C),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 0.09))),
          inputAndTitle(context),
          Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 40),
              width: Get.width,
              height: 48,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Get.theme.colorScheme.primary),
                  onPressed: () {
                    setState(() {
                      loading = true;
                    });

                    Future.delayed(const Duration(seconds: 2))
                        .then((value) => Navigator.pop(context));
                  },
                  child: loading == true
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Center(
                          child: Text('Save Changes',
                              style: TextStyle(color: Colors.white)))))
        ])));
  }
}

Widget inputAndTitle(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
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
          // ignore: prefer_const_constructors
          child: TextField(
            controller: TextEditingController(text: "Mahdi"),
            keyboardType: TextInputType.visiblePassword,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1.9,
            ),
            maxLines: 1,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              hintText: "Mahdi",
              hintStyle: TextStyle(
                color: Colors.black,
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
          child: const TextField(
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1.9,
            ),
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              hintText: "Mahdinaghikhani@gmail.com",
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Phone Number',
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
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.call,
                color: Get.theme.colorScheme.primary,
              ),
              contentPadding: const EdgeInsets.only(left: 14),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              hintText: "(+1) 234 567 890",
              hintStyle: const TextStyle(
                color: Colors.black,
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
            controller: TextEditingController(text: "dasdsdasdsa"),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off,
                    color: Color(0xFFB8B8B8),
                  )),
              contentPadding: const EdgeInsets.only(left: 14),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 0.6),
              ),
              hintText: "Mahdinaghikhani@gmail.com",
              hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
