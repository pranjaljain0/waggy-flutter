import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/screens/chat/AllChats.dart';
import 'package:waggy/screens/home/Recommendation/LikedPage.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:waggy/widgets/HomeWidgets/ProfileCard.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({Key? key}) : super(key: key);

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Grey",
    "Purple",
    "Pink"
  ];
  handleLike(item) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const LikedPage(),
          transitionsBuilder: (c, anim, a2, child) => FadeTransition(
              child: child,
              // position: _insetAnimation,
              opacity: anim),
          transitionDuration: const Duration(milliseconds: 500),
        )
        // MaterialPageRoute(builder: (context) => const LikedPage()),
        );
    _matchEngine!.currentItem?.like();
  }

  handleDislike(item) {
    _matchEngine!.currentItem?.nope();
  }

  handleSuperLike(item) {
    _matchEngine!.currentItem?.superLike();
  }

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i]),
          likeAction: () {
            handleLike(_names[i]);
          },
          nopeAction: () {
            handleDislike(_names[i]);
          },
          superlikeAction: () {
            handleSuperLike(_names[i]);
          },
          onSlideUpdate: (SlideRegion? region) async {
            // print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(80.0),
          bottomRight: Radius.circular(80.0),
        ),
        child: Container(
            height: 380,
            decoration: const BoxDecoration(color: AppColors.PRIMARY_COLOR)),
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Hello, Orthros",
                  style: TextStyle(
                      color: AppColors.WHITE_COLOR,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: AppColors.WHITE_COLOR,
                  size: 40,
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.notifications,
                        color: AppColors.WHITE_COLOR,
                        size: 24,
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 200,
                  child: Text(
                    "Meet the right dog for your pet <3",
                    style: TextStyle(
                        color: AppColors.WHITE_COLOR,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ClipOval(
                  child: Material(
                    color: AppColors.WHITE_COLOR, // button color
                    child: InkWell(
                      splashColor: AppColors.WHITE_COLOR, // inkwell color
                      child: const SizedBox(
                          width: 56,
                          height: 56,
                          child: Image(
                              image:
                                  AssetImage("assets/images/icon_chat.png"))),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllChats()),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 450,
            width: 330,
            child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return ProfileCard(
                  name: _swipeItems[index].content.text,
                  handleLike: handleLike,
                  handleDislike: handleDislike,
                  handleSuperLike: handleSuperLike,
                );
              },
              onStackFinished: () {},
              itemChanged: (SwipeItem item, int index) {},
              upSwipeAllowed: true,
              fillSpace: true,
            ),
          ),
        ],
      )
    ]);
  }
}

class Content {
  final String text;

  Content({
    required this.text,
  });
}
