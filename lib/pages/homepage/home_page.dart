import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'package:beethoven/constants.dart';

class HomePage extends StatelessWidget {
  final server;
  const HomePage({Key key, this.server}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: Body());
  }
}

// class SeassionCard extends StatelessWidget {
//   final int seassionNum;
//   final bool isDone;
//   final Function press;
//   const SeassionCard({
//     Key key,
//     this.seassionNum,
//     this.isDone = false,
//     this.press,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraint) {
//       return ClipRRect(
//         borderRadius: BorderRadius.circular(13),
//         child: Container(
//           width: constraint.maxWidth / 2 -
//               10, // constraint.maxWidth provide us the available with for this widget
//           // padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(13),
//             boxShadow: [
//               BoxShadow(
//                 offset: Offset(0, 17),
//                 blurRadius: 23,
//                 spreadRadius: -13,
//                 color: kShadowColor,
//               ),
//             ],
//           ),
//           child: Material(
//             color: Colors.transparent,
//             child: InkWell(
//               onTap: press,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: <Widget>[
//                     Container(
//                       height: 42,
//                       width: 43,
//                       decoration: BoxDecoration(
//                         color: isDone ? kBlueColor : Colors.white,
//                         shape: BoxShape.circle,
//                         border: Border.all(color: kBlueColor),
//                       ),
//                       child: Icon(
//                         Icons.play_arrow,
//                         color: isDone ? Colors.white : kBlueColor,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       "Session $seassionNum",
//                       style: Theme.of(context).textTheme.subtitle,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
