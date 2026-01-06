import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:shamsi_mobile_template/presentation/components/dropdown/model/dropdown_model.dart';
import 'package:shamsi_mobile_template/presentation/shared/shared.dart';

class PrimaryDropdown extends StatelessWidget {
  final List<DropdownModel> list;
  final Function(DropdownModel?)? onChanged;
  final DropdownModel? initialValue;

  const PrimaryDropdown({
    super.key,
    required this.list,
    this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    DropdownModel? validInitialValue = initialValue;
    if (initialValue != null && !list.contains(initialValue)) {
      validInitialValue = null;
    }
    return CustomDropdown<DropdownModel>(
      decoration: const CustomDropdownDecoration(
        expandedFillColor: UIColor.clear,
        closedFillColor: UIColor.clear,
        closedSuffixIcon: Icon(
          CupertinoIcons.chevron_down,
          color: UIColor.darkGrey,
          size: 18,
        ),
        expandedSuffixIcon: Icon(
          CupertinoIcons.chevron_up,
          color: UIColor.darkGrey,
          size: 18,
        ),
        listItemStyle: TextStyle(
          fontSize: 14,
        ),
        headerStyle: TextStyle(
          fontSize: 14,
        ),
        hintStyle: TextStyle(
          color: UIColor.primary,
          overflow: TextOverflow.ellipsis,
          fontSize: 14,
        ),
      ),
      hintText: 'Seçin',
      closedHeaderPadding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      initialItem: validInitialValue,
      listItemBuilder: (context, item, isSelected, index) {
        return Label(
          text: item.title,
          size: 14,
          color: UIColor.primary,
        );
      },
      headerBuilder: (context, value, isSelected) {
        return Label(
          text: value.title,
          size: 14,
          color: UIColor.primary,
          overflow: TextOverflow.ellipsis,
        );
      },
      items: list,
      onChanged: onChanged,
    );
  }
}
