import 'package:flutter/material.dart';
import 'pagemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnBoarding extends StatefulWidget {

 /* final List<Trip> availableTrips;

  OnBoarding(this.availableTrips);*/

  // OnBoarding();

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late List<PageModel> pages;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPages() {
    pages = <PageModel>[];
    // pages.add(PageModel(
    //     'assets/image/newsapp_001_a.png'));
    // pages.add(PageModel(
    //     'assets/image/newsapp_001_a_1.png'));
    pages.add(PageModel(
        'assets/image/newsapp_002.png'));
    pages.add(PageModel(
        'assets/image/newsapp_003.png'));
    pages.add(PageModel(
        'assets/image/newsapp_004.png'));
    pages.add(PageModel(
        'assets/image/newsapp_005.png'));
    pages.add(PageModel(
        'assets/image/newsapp_006.png'));
    pages.add(PageModel(
        'assets/image/newsapp_007.png'));
    pages.add(PageModel(
        'assets/image/newsapp_008.png'));

  }

  @override
  Widget build(BuildContext context) {
    _addPages();

    return Stack(
      children: <Widget>[
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                           pages[index].image,
                            // 'photo-1557825835-a526494be845.jpeg'

                        ),
                        // fit: BoxFit.cover,

                        fit: BoxFit.fill,

                      ),
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     Transform.translate(
                  //       child: Icon(
                  //         pages[index].icon,
                  //        // 'photo-1557825835-a526494be845.jpeg',
                  //         size: 150,
                  //         color: Colors.white,
                  //       ),
                  //       offset: Offset(0, -100),
                  //     ),
                  //     Text(
                  //       pages[index].title,
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 28,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //     Padding(
                  //       padding:
                  //       const EdgeInsets.only(left: 48, right: 48, top: 18),
                  //       child: Text(
                  //         pages[index].description,
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 16,
                  //         ),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, 175),
          child: Align(
            alignment: Alignment.center,
           // child: _displayPageIndicators(pages.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Colors.black45,
                child: Text(
                  'الرجوع إلى القائمة الرئيسية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontFamily: 'Cairo',
                  ),
                ),
                onPressed: () {
                 /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {

                       // _updateSeen();

                       //  Navigator.pushNamed(context, '/');
                       // return HomeScreen();

                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  );*/


                 // Navigator.pushNamed(context, '/');

                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget _displayPageIndicators(int length) {
  //   return PageViewIndicator(
  //     pageIndexNotifier: _pageViewNotifier,
  //     length: length,
  //     normalBuilder: (animationController, index) => Circle(
  //       size: 8.0,
  //       color: Colors.grey,
  //     ),
  //     highlightedBuilder: (animationController, index) => ScaleTransition(
  //       scale: CurvedAnimation(
  //         parent: animationController,
  //         curve: Curves.ease,
  //       ),
  //       child: Circle(
  //         size: 12.0,
  //         color: Colors.red,
  //       ),
  //     ),
  //   );
  // }

/*
 void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool( 'seen' , true);

    prefs.setBool( 'seen' , true);
  }
*/


}