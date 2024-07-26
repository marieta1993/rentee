extension DateTimeExt on DateTime {
  get shortDate {
    return '$day/$month/$year';
  }

  get timeFromDate {
    return '$hour:$second';
  }
}
