
import 'package:flutter/material.dart';
import 'package:social_academy/core/utils/constants.dart';
import 'package:social_academy/features/register/widgets/styles.dart';
class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    // late AppLocalizations locale;
    // locale = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Transform.translate(
              offset: const Offset(-7, 0),
              child: Radio(
                  activeColor: kPrimaryColor,
                  value: 'ذكر',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as String;
                    });
                  }),
            ),
            Text(
            "male",
              style: Styles.textStyle18.copyWith(
                fontSize: 12,
                color: kTextColor,
              ),
            ),
          ],
        ),
        // const SizedBox(
        //   width: 50,
        // ),
        Row(
          children: [
            Transform.translate(
              offset: const Offset(-7, 0),
              child: Radio(
                  activeColor: kPrimaryColor,
                  value: 'أنثي',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as String;
                    });
                  }),
            ),
            Text(
            "female",
              style: Styles.textStyle18.copyWith(
                fontSize: 12,
                color: kTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
