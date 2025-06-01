import 'package:flutter/material.dart';
import 'package:rht_mobile_template/presentation/shared/shared.dart';

class PinField extends StatelessWidget {
  final int maxNumberOfFields;
  final String pin;
  final bool isObscure;
  final String? error;

  const PinField({
    super.key,
    this.maxNumberOfFields = 4,
    this.pin = '',
    required this.isObscure,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (int i = 0; i < maxNumberOfFields; i++) i].map(
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Center(
              child: index < pin.length
                  ? Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: error != null ? UIColor.red : UIColor.black,
                        shape: BoxShape.circle,
                      ),
                    )
                  : Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: UIColor.grey.withOpacity(0.2),
                      ),
                    ),
            ),
          );
        },
      ).toList(),
    );
  }
}
