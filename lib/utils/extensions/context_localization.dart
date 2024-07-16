import 'package:flutter/cupertino.dart';
import 'package:localization/localization.dart';

extension LocalizationExt on BuildContext {
  get localized => AppLocalizations.of(this);
}
