import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:{{name.snakeCase()}}/presentation/components/delegate/carousel_pageable.dart';
import 'package:{{name.snakeCase()}}/presentation/shared/shared.dart';

class PageIndicator extends StatelessWidget {
  final List<CarouselPageable> items;

  const PageIndicator({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          items.length,
          (index) {
            final item = items[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: AnimatedContainer(
                height: 8.w,
                width: 8.w,
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: item.isSelected
                      ? UIColor.black
                      : UIColor.black.withOpacity(0.2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.w),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
