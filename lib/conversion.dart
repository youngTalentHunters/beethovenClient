import 'package:beethoven/constant/scale_with_container.dart';
import 'package:beethoven/constants.dart';
import 'package:flutter/material.dart';

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

String valueToStringScale(int value) {
  switch (value) {
    case 0:
      return "do";
      break;
    case 1:
      return "re";
      break;
    case 2:
      return "mi";
      break;
    case 3:
      return "pa";
      break;
    case 4:
      return "sol";
      break;
    case 5:
      return "la";
      break;
    case 6:
      return "si";
      break;
    case 7:
      return "doHigh";
      break;
    default:
      return "do";
  }
}

String valueToStringScaleKo(int value) {
  switch (value) {
    case 0:
      return "도";
      break;
    case 1:
      return "레";
      break;
    case 2:
      return "미";
      break;
    case 3:
      return "파";
      break;
    case 4:
      return "솔";
      break;
    case 5:
      return "라";
      break;
    case 6:
      return "시";
      break;
    case 7:
      return "도";
      break;
    default:
      return "도";
  }
}

Padding stringToImage(String value) {
  switch (value) {
    case "do":
      return doScale;
      break;
    case "re":
      return reScale;
      break;
    case "mi":
      return miScale;
      break;
    case "pa":
      return faScale;
      break;
    case "sol":
      return solScale;
      break;
    case "la":
      return laScale;
      break;
    case "si":
      return siScale;
      break;
    case "doHigh":
      return doHighScale;
      break;
    default:
      return doScale;
  }
}
