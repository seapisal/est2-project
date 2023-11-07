// import 'package:flutter/material.dart';
// import 'dart:math';
//
// final double buttonSize = 80;
//
// class CircularFab extends StatefulWidget {
//   const CircularFab({super.key});
//
//   @override
//   State<CircularFab> createState() => _CircularFabState();
// }
//
// class _CircularFabState extends State<CircularFab>
//   with SingleTickerProviderStateMixin{
//     late AnimationController controller;
//
//     @override
//     void initState(){
//       super.initState();
//
//       controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 250));
//   }
//     @override
//     void dispose(){
//       controller.dispose();
//       super.dispose();
//   }
//
//
//     @override
//     Widget build(BuildContext context) {
//       return Flow(
//         delegate: FlowMenuDelegate(controller: controller,),
//         children: <IconData>[
//           Icons.image,
//           Icons.camera,
//         ].map<Widget>(buildFAB).toList(),
//       );
//
//     }
//     Widget buildFAB(IconData icon)=> SizedBox(
//       width: buttonSize,
//       height: buttonSize,
//       child: FloatingActionButton(
//         elevation: 0,
//         splashColor: Colors.black87,
//         onPressed: (){
//           if (controller.status == AnimationStatus.completed){
//             controller.reverse();
//           }else{
//             controller.forward();
//           }
//         },
//         child: Icon(icon, color: Colors.white,size: 45,),
//
//       ),
//     );
// }
//
//
//
//
// class FlowMenuDelegate extends FlowMenuDelegate {
//   final Animation<double> controller;
//
//   const FlowMenuDelegate ({required this.controller,})
//       : super(repaint: controller);
//
//   @override
//   void paintChildren(FlowPaintingContext context){
//     final size = context.size;
//     final xStart = size.width -buttonSize;
//     final yStart = size.width -buttonSize;
//
//     final n = context.childCount;
//     for (int i=0; i< n ; i++){
//     final isLastItem = i == context.childCount -1 ;
//     final setValue = (value) => isLastItem ? 0.0 : value ;
//
//     final radius = 180 * controller.value;
//
//     final theta = i * pi * 0.5 / (n - 2);
//     final x = xStart - setValue(radius * cos(theta));
//     final y = yStart - setValue(radius * sin(theta));
//
//     context.paintChild(
//       i,
//       transform: Matrix4.identity()
//         ..translate(x,y,0)
//         ..translate(buttonSize / 2, buttonSize / 2)
//         ..rotateZ(isLastItem ? 0.0 : 180 * (1 - controller.value))
//         ..scale(isLastItem ? 1.0 : max(controller.value,0.5))
//         ..translate(-buttonSize / 2, -buttonSize / 2)
//     );
//     }
//   }
//   @override
//   bool shouldRepaint(FlowMenuDelegate oldDelegate)=> false;
// }
