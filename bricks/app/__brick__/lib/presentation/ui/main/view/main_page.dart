import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:provider/provider.dart';
import 'package:{{name.snakeCase}}/app/cubit/app_cubit.dart';
import 'package:{{name.snakeCase}}/presentation/components/appbar/primary_app_bar.dart';
import 'package:{{name.snakeCase}}/presentation/components/navbar/primary_bottom_navigation_bar.dart';
import 'package:{{name.snakeCase}}/presentation/ui/main/provider/main_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    final appCubit = context.read<AppCubit>();
    final item = mainProvider.items[mainProvider.currentIndex];
    final localizationItem = item.localizationItem;
    return Scaffold(
      appBar: PrimaryAppBar(
        titleText: localizationItem,
        context,
        isLeading: false,
      ),
      body: LazyLoadIndexedStack(
        index: mainProvider.currentIndex,
        children: appCubit.pages,
      ),
      bottomNavigationBar: const PrimaryBottomNavigationBar(),
    );
  }
}
