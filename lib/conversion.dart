import 'package:beethoven/constants.dart';

import 'constant/scales.dart';
import 'constant/sheets.dart';

String typeToTitle(int type) {
  switch (type) {
    case 0:
      return "곰 세마리";
      break;
    case 1:
      return "작은 별";
      break;
    case 2:
      return "학교 종";
      break;
    default:
  }
  return "곰 세마리";
}

List typeToList(int type) {
  switch (type) {
    case 0:
      return threeBearsScale;
      break;
    case 1:
      return littleStarScale;
      break;
    case 2:
      return schoolBellScale;
      break;
    default:
  }
  return schoolBellScale;
}

List typeToSheetList(int type) {
  switch (type) {
    case 0:
      return threeBearsSheet;
      break;
    case 1:
      return littleStarSheet;
      break;
    case 2:
      return schoolBellSheet;
      break;
    default:
  }
  return schoolBellSheet;
}
