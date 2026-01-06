import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsi_mobile_template/presentation/components/navbar/primary_bottom_navigation_bar_item.dart';
import 'package:shamsi_mobile_template/presentation/shared/shared.dart';
import 'package:shamsi_mobile_template/presentation/ui/main/provider/main_provider.dart';

class PrimaryBottomNavigationBar extends StatelessWidget {
  const PrimaryBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    final items = mainProvider.items;

    return PopScope(
      canPop: mainProvider.currentIndex == 0 ? true : false,
      onPopInvokedWithResult: (_, result) {
        mainProvider.change(0);
      },
      child: BottomNavigationBar(
        currentIndex: mainProvider.currentIndex,
        items: items.asMap().entries.map((e) {
          final item = e.value;
          return BottomNavigationBarItem(
            icon: PrimaryBottomNavigationBarItem(
              icon: item.asset,
              text: item.localizationItem,
            ),
            activeIcon: PrimaryBottomNavigationBarItem(
              icon: item.asset,
              height: 20.h,
              color: UIColor.primary,
              index: mainProvider.currentIndex,
              isActive: true,
              textSize: 12.sp,
              text: item.localizationItem,
            ),
            label: "",
          );
        }).toList(),
        onTap: (index) {
          if (index != mainProvider.currentIndex) {
            mainProvider.change(index);
            HapticFeedback.lightImpact();
          }
        },
      ),
    );
  }
}
