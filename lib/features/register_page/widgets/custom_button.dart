import 'package:flutter/material.dart';
import 'package:social_academy/core/utils/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.buttonBackGroundColor,
      required this.screenWidth,
      required this.buttonTapHandler,
      required this.buttonText});
  var screenWidth = 0.0;
  Function buttonTapHandler;
  String buttonText;
  Color? buttonBackGroundColor;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        buttonTapHandler();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: kPrimaryColor),
            gradient: buttonBackGroundColor == null
                ? LinearGradient(colors: [
                    kPrimaryColor,
                    kSecondaryColor,
                  ])
                : LinearGradient(
                    colors: [buttonBackGroundColor!, buttonBackGroundColor!]),
            borderRadius: BorderRadius.circular(15)),
        height: screenSize.height * .06,
        width: 150.0,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            color: buttonBackGroundColor == null ? Colors.white : kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

//CUSTOM BOOK BUTTON (THARWAT)
// import 'package:flutter/material.dart';

// import '../utils/styles.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     required this.backgroundColor,
//     required this.textColor,
//     this.borderRadius,
//     required this.text,
//     this.fontSize,
//   });
//   final String text;
//   final Color backgroundColor;
//   final Color textColor;
//   final BorderRadius? borderRadius;
//   final double? fontSize;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 48,
//       child: TextButton(
//         onPressed: () {},
//         style: TextButton.styleFrom(
//           backgroundColor: backgroundColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: borderRadius ??
//                 BorderRadius.circular(
//                   12,
//                 ),
//           ),
//         ),
//         child: Text(
//           text,
//           style: Styles.textStyle18.copyWith(
//             color: textColor,
//             fontWeight: FontWeight.w900,
//             fontSize: fontSize,
//           ),
//         ),
//       ),
//     );
//   }
// }
