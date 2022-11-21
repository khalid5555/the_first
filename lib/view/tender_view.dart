// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors, sized_box_for_whitespace, avoid_print, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:get_storage/get_storage.dart';

// import 'package:the_frist/constants.dart';

// class TenderScreen extends StatefulWidget {
//   @override
//   _TenderScreenState createState() => _TenderScreenState();
// }

// class _TenderScreenState extends State<TenderScreen>
//     with TickerProviderStateMixin {
//   List<String> welcomeImages = [
//     "assets/images/final.png",
//     "assets/images/m2.png",
//     "assets/images/m1.png",
//   ];

//   @override
// Widget build(BuildContext context) {
//   // ignore: unused_local_variable
//   CardController controller; //Use this to trigger swap.

//   return Scaffold(
//     backgroundColor: Colors.black,
//     body: Stack(
//       children: [
//         Container(
//           height: double.infinity,
//           width: double.infinity,
//           child: Image(
//             fit: BoxFit.fill,
//             image: AssetImage('assets/images/as.jpg'),
//           ),
//         ),
//         Container(
//           alignment: Alignment.bottomCenter,
//           height: MediaQuery.of(context).size.height * 10,
//           child: TinderSwapCard(
//             swipeUp: false,
//             swipeDown: false,
//             orientation: AmassOrientation.bottom,
//             totalNum: welcomeImages.length,
//             stackNum: 4,
//             swipeEdge: 4.0,
//             maxWidth: MediaQuery.of(context).size.width * 1,
//             maxHeight: MediaQuery.of(context).size.width * 1.3,
//             minWidth: MediaQuery.of(context).size.width * .9,
//             minHeight: MediaQuery.of(context).size.width * .9,
//             cardBuilder: (context, index) => Card(
//               child: Image.asset(
//                 welcomeImages[index],
//                 fit: BoxFit.fill,
//               ),
//             ),
//             cardController: controller = CardController(),
//             swipeUpdateCallback:
//                 (DragUpdateDetails details, Alignment align) {
//               if (align.x < 0) {
//               } else if (align.x > 0) {}
//             },
//             swipeCompleteCallback:
//                 (CardSwipeOrientation orientaion, int index) {
//               print('index $index');
//               if (welcomeImages.length - 1 == index) {
//                 updatelogin();
//                 Get.to(SplashScreen());
//                 // Navigator.of(context).pushReplacementNamed('splashscreen');
//               }
//               print('index $index');
//             },
//           ),
//         )
//       ],
//     ),
//   );
// }

void upDateLogin() async {
  final GetStorage box = GetStorage();
  box.write('login', true);
  box.write('seen', true);
}
// }




// import 'package:swipe_cards/swipe_cards.dart';

// SwipeCards(
//             matchEngine: <MatchEngine>,
//             itemBuilder: (BuildContext context, int index) {},
//             onStackFinished: () {},
//             itemChanged: (SwipeItem item, int index) {},
//             upSwipeAllowed: <bool>,
//             fillSpace: <bool>,
// );

// SwipeItem(
//             content: "Anup Kumar Panwar",
//             likeAction: () {
//                 log("Like");
//             },
//             nopeAction: () {
//                 log("Nope");
//             },
//             superlikeAction: () {
//                 log("Superlike");
//             },
//             onSlideUpdate: (SlideRegion? region){
//                 log("Region $region");
//             }
// );


// List<SwipeItem> _swipeItems = List<SwipeItem>();
// MatchEngine _matchEngine;
// GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
// List<String> _names = ["Red", "Blue", "Green", "Yellow", "Orange"];
// List<Color> _colors = [
//   Colors.red,
//   Colors.blue,
//   Colors.green,
//   Colors.yellow,
//   Colors.orange
// ];

// @override
// void initState() {
//   for (int i = 0; i < _names.length; i++) {
//     _swipeItems.add(SwipeItem(
//         content: Content(text: _names[i], color: _colors[i]),
//         likeAction: () {
//           _scaffoldKey.currentState.showSnackBar(SnackBar(
//             content: Text("Liked ${_names[i]}"),
//             duration: Duration(milliseconds: 500),
//           ));
//         },
//         nopeAction: () {
//           _scaffoldKey.currentState.showSnackBar(SnackBar(
//             content: Text("Nope ${_names[i]}"),
//             duration: Duration(milliseconds: 500),
//           ));
//         },
//         superlikeAction: () {
//           _scaffoldKey.currentState.showSnackBar(SnackBar(
//             content: Text("Superliked ${_names[i]}"),
//             duration: Duration(milliseconds: 500),
//           ));
//         },
//         onSlideUpdate: (SlideRegion? region) async {
//           print("Region $region");
//         }));
//   }

//   _matchEngine = MatchEngine(swipeItems: _swipeItems);
//   super.initState();
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//           child: Column(children: [
//         Container(
//           height: 550,
//           child: SwipeCards(
//             matchEngine: _matchEngine,
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 alignment: Alignment.center,
//                 color: _swipeItems[index].content.color,
//                 child: Text(
//                   _swipeItems[index].content.text,
//                   style: TextStyle(fontSize: 100),
//                 ),
//               );
//             },
//             onStackFinished: () {
//               _scaffoldKey.currentState.showSnackBar(SnackBar(
//                 content: Text("Stack Finished"),
//                 duration: Duration(milliseconds: 500),
//               ));
//             },
//             itemChanged: (SwipeItem item, int index) {
//               print("item: ${item.content.text}, index: $index");
//             },
//             upSwipeAllowed: true,
//             fillSpace: true,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             RaisedButton(
//                 onPressed: () {
//                   _matchEngine.currentItem.nope();
//                 },
//                 child: Text("Nope")),
//             RaisedButton(
//                 onPressed: () {
//                   _matchEngine.currentItem.superLike();
//                 },
//                 child: Text("Superlike")),
//             RaisedButton(
//                 onPressed: () {
//                   _matchEngine.currentItem.like();
//                 },
//                 child: Text("Like"))
//           ],
//         )
//       ])));
// }



// class Content {
//   final String text;
//   final Color color;

//   Content({this.text, this.color});
// }
