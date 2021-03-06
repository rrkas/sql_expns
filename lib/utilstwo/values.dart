Map<int, String> monthMap = {
  1: 'January',
  2: 'February',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December',
};

int previousMonth(int month) {
  int _previousMonth = month - 1;
  if (_previousMonth == 0) {
    return 12;
  }
  return _previousMonth;
}

int whichYear(int year, int prevMonth) {
  if (prevMonth - 1 == 0) {
    return year - 1;
  }
  return year;
}
