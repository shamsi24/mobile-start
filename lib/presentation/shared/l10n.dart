import 'package:easy_localization/easy_localization.dart';

/// Centralized localization access
/// Usage: AppL10n.ok
class Lng {
  /* ───────────── COMMON ───────────── */

  static String get ok => 'common.ok'.tr();
  static String get yes => 'common.yes'.tr();
  static String get no => 'common.no'.tr();
  static String get confirm => 'common.confirm'.tr();
  static String get approve => 'common.approve'.tr();
  static String get close => 'common.close'.tr();
  static String get cancel => 'common.cancel'.tr();
  static String get next => 'common.next'.tr();
  static String get back => 'common.back'.tr();
  static String get skip => 'common.skip'.tr();
  static String get start => 'common.start'.tr();
  static String get buyNow => 'common.buyNow'.tr();
  static String get save => 'common.save'.tr();
  static String get delete => 'common.delete'.tr();
  static String get edit => 'common.edit'.tr();
  static String get filter => 'common.filter'.tr();
  static String get all => 'common.all'.tr();
  static String get open => 'common.open'.tr();
  static String get closed => 'common.closed'.tr();
  static String get example => 'common.example'.tr();

  /* ───────────── AUTH ───────────── */

  static String get login => 'auth.login'.tr();
  static String get logout => 'auth.logout'.tr();
  static String get logoutConfirm => 'auth.logoutConfirm'.tr();
  static String get loginAsGuest => 'auth.loginAsGuest'.tr();
  static String get enterOtpCode => 'auth.enterOtpCode'.tr();
  static String get resend => 'auth.resend'.tr();
  static String get forgotPin => 'auth.didYouForgetPin'.tr();
  static String get resetPinConfirm => 'auth.resetPinConfirm'.tr();

  /* ───────────── VALIDATION ───────────── */

  static String get cantBeEmpty => 'validation.cantBeEmpty'.tr();
  static String get minimum6Symbol => 'validation.minimum6SymbolError'.tr();
  static String get minimum7Symbol => 'validation.minimum7SymbolError'.tr();
  static String get minimum12Symbol => 'validation.minimum12SymbolError'.tr();
  static String get amountCantBeSmallOrEqualZero =>
      'validation.amountCantBeSmallOrEqualZero'.tr();

  /* ───────────── NETWORK ───────────── */

  static String get noInternet => 'network.noInternet'.tr();
  static String get errorOccurred => 'network.errorOccurred'.tr();

  /* ───────────── PAYMENT ───────────── */

  static String get balance => 'payment.balance'.tr();
  static String get topUp => 'payment.topUp'.tr();
  static String get enterAmount => 'payment.enterAmount'.tr();
  static String get confirmAmount => 'payment.confirmAmount'.tr();
  static String get paymentFailed => 'payment.paymentFailed'.tr();
  static String get payWithWallet => 'payment.payWithWallet'.tr();
  static String get azn => 'payment.azn'.tr();

  /* ───────────── DATES ───────────── */

  static String get startTime => 'dates.startTime'.tr();
  static String get endTime => 'dates.endTime'.tr();
  static String get expiryDate => 'dates.expiryDate'.tr();
  static String get history => 'dates.history'.tr();

  /* ───────────── STATUS ───────────── */

  static String get inProgress => 'status.inProgress'.tr();
  static String get completed => 'status.completed'.tr();
  static String get timeout => 'status.timeout'.tr();
  static String get active => 'status.active'.tr();

  /* ───────────── LANGUAGE ───────────── */

  static String get changeLanguage => 'language.changeLanguage'.tr();
  static String get az => 'language.az'.tr();
  static String get tr => 'language.tr'.tr();
  static String get en => 'language.en'.tr();
  static String get ru => 'language.ru'.tr();

  /* ───────────── DOCUMENTS ───────────── */

  static String get privacyPolicy => 'documents.privacyPolicy'.tr();
  static String get termsOfUse => 'documents.termsOfUse'.tr();
  static String get termsAndConditions => 'documents.termsAndConditions'.tr();
  static String get personalDataPolicy => 'documents.personalDataPolicy'.tr();
  static String get documents => 'documents.documents'.tr();

  /* ───────────── PARAMETRIC EXAMPLE ───────────── */

  static String minimumSymbol(int count) => 'validation.minimumSymbol'.tr(
        namedArgs: {'count': count.toString()},
      );
}
