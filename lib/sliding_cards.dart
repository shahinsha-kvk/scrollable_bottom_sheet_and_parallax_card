import 'package:flutter/material.dart';
import 'card_content.dart';
import 'card_model.dart';
import 'dart:math' as math;

class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({super.key});

  @override
  State<SlidingCardsView> createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.62,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: pageController,
        itemCount: demoCardData.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double pageOffset = 0;
              if (pageController.position.haveDimensions) {
                pageOffset = pageController.page! - index;
              }
              double gauss = math.exp(
                -math.pow(pageOffset.abs() - 0.5, 2) / 0.08,
              );

              return Transform.translate(
                offset: Offset(
                  -32 * gauss * pageOffset.sign,
                  0,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    right: screenWidth * 0.02,
                    bottom: screenHeight * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(
                          screenWidth * 0.02,
                          screenHeight * 0.03,
                        ),
                        blurRadius: screenWidth * 0.06,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                        child: Image.asset(
                          'assets/${demoCardData[index].image}',
                          height: screenHeight * 0.3,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment(pageOffset, 0),
                        ),
                      ),
                      // Rest of the content
                      Expanded(
                        child: CardContent(
                          name: demoCardData[index].name,
                          date: demoCardData[index].date,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
