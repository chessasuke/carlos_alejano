// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// class Projects extends StatelessWidget {
//   const Projects({Key? key, required this.width}) : super(key: key);

//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     return Center(
//       child: Container(
//         width: width,
//         decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.background,
//             border: Border.all(color: Theme.of(context).colorScheme.onSurface),
//             borderRadius: const BorderRadius.all(Radius.circular(10))),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Projects',
//                 textAlign: TextAlign.justify,
//               ),
//               const SizedBox(height: 30),
//               ...buildCardList(screenSize)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<Widget> buildCardList(Size screenSize) {
//     List<Widget> jobCards = [];
//     final size = projTitles.length;
//     if (screenSize.width >= 1100) {
//       for (int i = 0; i < size; i += 2) {
//         final row = Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             ProjectEntry(
//               projTitle: projTitles[i],
//               projShortDesc: projShortDesc[i],
//               projLongDesc: projLongDesc[i],
//               link: projLinks[i],
//               tags: tags[i].toString(),
//               width: width * 0.4,
//             ),
//             if (i + 1 < size)
//               ProjectEntry(
//                 projTitle: projTitles[i + 1],
//                 projShortDesc: projShortDesc[i + 1],
//                 projLongDesc: projLongDesc[i + 1],
//                 link: projLinks[i + 1],
//                 tags: tags[i + 1].toString(),
//                 width: width * 0.4,
//               )
//             else
//               ProjectEntry(
//                 projTitle: '',
//                 projShortDesc: '',
//                 projLongDesc: '',
//                 tags: '',
//                 link: '',
//                 width: width * 0.4,
//                 visible: false,
//               )
//           ],
//         );
//         jobCards.add(row);
//       }
//     } else if (screenSize.width < 1100) {
//       for (int i = 0; i < projTitles.length; ++i) {
//         jobCards.add(ProjectEntry(
//           projTitle: projTitles[i],
//           projShortDesc: projShortDesc[i],
//           projLongDesc: projLongDesc[i],
//           link: projLinks[i],
//           tags: tags[i].toString(),
//           width: width * 0.8,
//         ));
//       }
//     }

//     return jobCards;
//   }
// }

// class ProjectEntry extends StatelessWidget {
//   const ProjectEntry({
//     Key? key,
//     required this.projTitle,
//     required this.projShortDesc,
//     required this.projLongDesc,
//     required this.width,
//     required this.link,
//     required this.tags,
//     this.visible = true,
//   }) : super(key: key);

//   final String projTitle;
//   final String projShortDesc;
//   final String projLongDesc;
//   final String tags;
//   final String link;
//   final double width;
//   final bool visible;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: () {
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return Center(
//                   child: Container(
//                     constraints: const BoxConstraints(maxWidth: 500),
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).colorScheme.surface,
//                         border: Border.all(
//                             color: Theme.of(context).colorScheme.onSurface),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10))),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: GestureDetector(
//                               onTap: () => Utils.launchURL(link.trim()),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(projTitle,
//                                       style: FlexTextStyle.getStyle(context)
//                                           .bodyText1!
//                                           .copyWith(
//                                               fontWeight: FontWeight.bold,
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .primary)),
//                                   const SizedBox(width: 10),
//                                   Icon(
//                                     FontAwesomeIcons.externalLinkAlt,
//                                     color:
//                                         Theme.of(context).colorScheme.primary,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: SelectableText(projLongDesc,
//                                 style:
//                                     FlexTextStyle.getStyle(context).bodyText1),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               });
//         },
//         child: Center(
//           child: Container(
//             width: width,
//             height: 150,
//             decoration: visible
//                 ? BoxDecoration(
//                     color: Theme.of(context).colorScheme.surface,
//                     border: Border.all(
//                         color: Theme.of(context).colorScheme.onSurface),
//                     borderRadius: const BorderRadius.all(Radius.circular(10)))
//                 : null,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 if (visible)
//                   Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: GestureDetector(
//                       onTap: () => Utils.launchURL(link.trim()),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(projTitle,
//                               style: FlexTextStyle.getStyle(context)
//                                   .bodyText1!
//                                   .copyWith(
//                                       fontWeight: FontWeight.bold,
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .primary)),
//                           const SizedBox(width: 10),
//                           Icon(
//                             FontAwesomeIcons.externalLinkAlt,
//                             color: Theme.of(context).colorScheme.primary,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Text(projShortDesc,
//                       style: FlexTextStyle.getStyle(context).bodyText2!),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Text(tags,
//                       style: FlexTextStyle.getStyle(context)
//                           .bodyText2!
//                           .copyWith(
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .secondaryVariant)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
