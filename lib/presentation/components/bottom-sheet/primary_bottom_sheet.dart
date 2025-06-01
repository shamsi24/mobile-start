import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rht_mobile_template/presentation/components/button/primary_button.dart';
import 'package:rht_mobile_template/presentation/router/navigation.dart';
import 'package:rht_mobile_template/presentation/shared/shared.dart';

class PrimaryBottomSheet {
  static show(
    context, {
    String? text,
    VoidCallback? didTap,
    List<PrimaryButton>? buttons,
    bool isDismissible = true,
  }) async {
    return await showModalBottomSheet(
      context: context,
      barrierColor: UIColor.black.withOpacity(0.3),
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.fastEaseInToSlowEaseOut,
        reverseDuration: const Duration(milliseconds: 300),
        duration: const Duration(milliseconds: 500),
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      isDismissible: isDismissible,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        splashRadius: 22,
                        onPressed: didTap ?? () => Navigation.pop(),
                        icon: const Icon(CupertinoIcons.clear),
                      ),
                    ),
                  ),
                  if (text != null)
                    Text(
                      text,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  if (text != null) 30.vertical,
                  if (buttons != null)
                    for (var i in buttons) ...[
                      i,
                      8.vertical,
                    ],
                  30.vertical,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
