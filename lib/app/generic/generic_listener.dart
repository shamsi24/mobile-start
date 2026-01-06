import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsi_mobile_template/app/generic/generic_state.dart';
import 'package:shamsi_mobile_template/presentation/components/bottom-sheet/primary_bottom_sheet.dart';

class GenericListener<B extends StateStreamable<S>, S>
    extends BlocListener<B, S> {
  const GenericListener({
    super.key,
    required super.listener,
    super.child,
  });

  @override
  BlocWidgetListener<S> get listener {
    return (context, state) {
      super.listener(context, state);

      if (state is Failure) {
        PrimaryBottomSheet.show(context, text: state.error.message);
      }
    };
  }
}
