import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newsapi_01/layout/news_app/news_cubit/cubit.dart';
import 'package:newsapi_01/layout/news_app/news_cubit/states.dart';
import 'package:newsapi_01/layout/news_app/news_cubit/states.dart';
import 'package:newsapi_01/layout/news_app/news_cubit/states.dart';
import 'package:newsapi_01/layout/news_app/news_cubit/states.dart';
import 'package:newsapi_01/layout/news_app/news_cubit/states.dart';

import 'package:newsapi_01/layout/news_app/theme_cubit/theme_cubit.dart';
import 'package:newsapi_01/modules/web_view/web_view_screen.dart';
import 'package:sqflite/sqflite.dart';


var datetest;

// Map<DateTime, dynamic>? datetest;

Database? dataBase;

IconData fabIcon =  Icons.favorite_outline;
IconData fabIcon3 =  Icons.favorite_sharp;
bool fabIcon2 = true;

double numbera = 60;

//
// //**********************
//
// getCurrentDate(finalDate) {
//   // var date = DateTime.now().toString();
//   // var dateParse = DateTime.parse(date);
//   // var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
//   // //finalDate = formattedDate.toString();
//   // finalDate = formattedDate.toString();
//
// // *************
//
//   // DateFormat.MMMMEEEEd().format(finalDate).toString();
// // *************

//
//   DateTime.utc(finalDate);
// }
//
// **********************

Future<Widget> defaultButton({
  bool isUpperCase = true,
  double width = double.infinity,
  double radius = 0,
  Color background = Colors.blue,
  required VoidCallback onPressed, // voidCallback = void Function()
  required String text,
}) async =>
    Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget imageTest(itemMap) {
  return FadeInImage.assetNetwork(
    height: 150,
    width: 150,
    fit: BoxFit.cover,
    fadeInDuration: Duration(milliseconds: 800),
    fadeInCurve: Curves.fastLinearToSlowEaseIn,
    placeholder: 'assets/image/Default_Image.png',
    image: itemMap['urlToImage']??'assets/image/Default_Image.png',
    imageErrorBuilder: (context, error, stackTrace) {
      return Container(
        height: 150,
        width: 150,
        child: Image.asset(
          'assets/image/Default_Image.png',
          fit: BoxFit.cover,
        ),
      );
    },
  );
}



Widget articleItem(Map itemMap,context) => Dismissible(
  key: Key(itemMap['id'].toString()),
  onDismissed: (direction) {
    NewsCubit.get(context).deleteData(id: itemMap['id']);
  }, child: Padding(
  padding: const EdgeInsets.all(16.0),
  child: InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen(itemMap['url']));
    },

    child: Column(
      children: [
        Column(
          children: [
            Text(
              '${itemMap['source']['name']}',
             //======= textDirection: TextDirection.rtl,
             //======= textDirection: TextDirection.rtl,
              // style: Theme.of(context).textTheme.bodyText1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,

              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 35,
                fontFamily: 'Tajawal',
              ),
            ),
          ],
        ),
        SizedBox(
          width: 55,
          height: 25,
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageTest(itemMap),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        '${itemMap['title']}',
                        //======= textDirection: TextDirection.rtl,
                        // style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,

                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'Tajawal',
                        ),


                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                          //'${itemMap['publishedAt']}',
                          // '${itemMap['publishedAt']}' + " توقيت غرينتش (GMT)",
                          //'${itemMap[ DateTime.parse('publishedAt').day]}',


                           // '${itemMap['publishedAt']}' + " (GMT)غرينتش",

                          // '${itemMap['publishedAt']}',

                     // getCurrentDate(${itemMap['publishedAt']}),

                          // DateFormat.MMMMEEEEd().format('${itemMap['publishedAt']}'),

                          // ******************

                          // '${itemMap['publishedAt']}',

                        //  '${itemMap['publishedAt']}',

                         // DateFormat.MMMMEEEEd().format('publishedAt').toString(),

                       // '${itemMap['publishedAt']}',

                       //   DateTime.parse('${itemMap['publishedAt']}'),

                     // DateTime.parse("2019-07-19 8:40:23"),

                         // '${itemMap['publishedAt']}',

                         // DateTime.utc('${itemMap['publishedAt']}'),

             // getCurrentDate(int.parse('${itemMap['publishedAt']}')),
             // getCurrentDate(int.parse('${itemMap['publishedAt']}')),
            //  getCurrentDate(int.parse('${itemMap['publishedAt']}').toString()),

                   // int.parse('${itemMap['publishedAt']}').toString(),

                    // int.parse('${itemMap['publishedAt']}').toString(),

                       // DateTime.now().day.toString(),
                         // DateTime.now().hour.toString(),

                         // DateTime.('${itemMap['publishedAt']}').hour.toString(),

                        //  DateTime.now().hour.toString(),

                //           DateTime.parse(json["publishedAt"]),
                // "publishedAt": publishedAt.toIso8601String(),

                          // '${itemMap['publishedAt']}'.toIso8601String(),
                          // '${itemMap['publishedAt']}'.toIso8601String();

                          // DateTime.now().hour.toString(),

                   // DateFormat.MMMMEEEEd().format(DateTime.now()),



                    // DateFormat publishedAt
                    //
                    // Text(
                    // (DateFormat.MMMMEEEEd().format(snapshotlist
                    //     .data[index].publishedAt
                    //     .toLocal()) +
                    //     " " +
                    //     DateFormat.jm().format(snapshotlist
                    //         .data[index].publishedAt
                    //         .toLocal())),
                    //     maxLines: 2,
                    //     style: Theme.of(context).textTheme.overline,
                    //   ),


                          // datetest = '${itemMap['publishedAt']}',

                      //  semanticsLabel: (DateFormat.MMMMEEEEd().format(datetest.toLocal(),)),

                          // DateFormat.MMMMEEEEd().format(datetest)),

                          // DateFormat.yMMMd().format(value!)
                          // '${DateFormat.yMMMd().format(itemMap['publishedAt'])}',

                          // ******************

                        // ******************
                        Text(
                          DateFormat.MMMMEEEEd().format(DateTime.now()) + "   " +
                              DateFormat.Hms().format(DateTime.now()),
                        // ******************
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RawMaterialButton(

                          focusColor: Colors.purple,
                          // hoverColor: Colors.blue,

                          onPressed: () {

                            // NewsCubit.get(context).insertToDatabase;
                            // navigateTo(context, WebViewScreen(itemMap['url']));
                            // NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}');

                           // NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}');
                            NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: DateFormat.MMMMEEEEd().format(DateTime.now()) + "   " +
                                DateFormat.Hms().format(DateTime.now()),url:'${itemMap['url']}',);


                           NewsCubit.get(context).changeBottomSheetState(isShow: true, icon: Icons.edit);



                           // NewsCubit.get(context).changeBottomSheetState(isShow: false, icon: Icons.edit);


                            //  NewsCubit.get(context).changeBottomSheetState(isShow: true, icon: Icons.edit);

                            // ***********************

                           // NewsCubit.get(context).changeBottomSheetState(isShow: true, icon: Icons.edit);


                           //  NewsCubit.get(context).fabIcon6 ?  Icon(Icons.list,) : Icon(Icons.data_usage_rounded,);

                           // NewsCubit.get(context).changeBottomSheetState(isShow: true, icon: Icon(Icons.invert_colors_on_sharp);



                            // NewsCubit.get(context).darkMode ? Colors.green : Colors.blue;


                           // ThemeCubit.get(context).darkMode ? Colors.black : Colors.white;

                         //  NewsCubit.get(context).changeFabIconState5(icon: Icons.favorite_sharp, size: 25.0 ,color: Colors.blue);

                                //  NewsCubit.get(context).changeFabIconState6();


                            // Row(
                            //   children: [
                            //     RawMaterialButton(onPressed: () {  },
                            //     child: Icon(Icons.favorite_sharp,
                            //       size: 15.0,),
                            //         padding: EdgeInsets.all(7.0),
                            //         shape: CircleBorder(),
                            //     ),
                            //   ],
                            // );


                            // NewsCubit.get(context).icontest();

                            // NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}, image: itemMap['urlToImage']);
                          },



                          elevation: 3.0,
                          fillColor: Colors.white,



                        // child:


                          // Icon(
                          //   Icons.favorite_outline,

                            // NewsCubit.changeFabIconState(
                            //   icon: Icons.favorite_outline),

                          // NewsCubit.changeFabIconState(
                          //     icon: Icons.favorite_outline),

                            // child: NewsCubit.changeFabIconState(
                            //  icon: Icons.favorite_outline);


                          // Icon(
                          //     Icons.favorite_outline,
                          //   size: 15.0,
                          // ),

                          // NewsCubit.get(context).changeFabIconState(icon: Icons.favorite_outline, size: 15);

                          // Icon(fabIcon2 ?
                          //       fabIcon : fabIcon3,
                          //     size: 15.0,),

                          // Icon(
                          //     Icons.favorite_outline,
                          //   size: 15.0,
                          // ),

                          child: NewsCubit.get(context).fabIcon6 ? Icon(Icons.favorite_outline,) : Icon(Icons.favorite_sharp,),

                         // NewsCubit.get(context).changeBottomSheetState(isShow: true, icon: Icons.edit);

                         // NewsCubit.get(context).fabIcon6 ?  Icon(Icons.data_usage_rounded,) : Icon(Icons.list,),

                          // : NewsCubit.get(context).changeFabIconState6();

                         // if (state == AppFabIconState6) ?  Icon(Icons.favorite_outline,size: 15.0,), : Icon(Icons.favorite_sharp,size: 30.0,),


                          // fillColor: NewsCubit.get(context).darkMode ? Colors.green : Colors.blue,
                          // fillColor: NewsCubit.get(context).darkMode ? Colors.green : Colors.blue,

                          padding: EdgeInsets.all(7.0),
                          shape: CircleBorder(),
                        ),


                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),
);





// *******************************************************************


Widget buttonViewSeparator() {
  return RawMaterialButton(
    focusColor: Colors.purple,
    onPressed: () {
      // NewsCubit.get(context).changeBottomSheetState(isShow: true, icon: Icons.edit);
 },
    elevation: 3.0,
    fillColor: Colors.white,
    child:
    Icon(
        Icons.announcement,
      size: 15.0,
    ),

    // NewsCubit.get(context).changeFabIconState(icon: Icons.favorite_outline, size: 15);

  //  NewsCubit.get(context).fabIcon6 ? Icon(Icons.favorite_outline,) : Icon(Icons.favorite_sharp,),
    padding: EdgeInsets.all(7.0),
    shape: CircleBorder(),
  );
}


// *******************************************************************

// ========================================

// ========================================


// ***** Widget articleItem_2(Map itemMap,context) => Dismissible(
Widget articleItem_2(itemMap,context) => Dismissible(
  key: Key(itemMap['id'].toString()),
  onDismissed: (direction) {
    NewsCubit.get(context).deleteData(id: itemMap['id']);
  }, child: Padding(
  padding: const EdgeInsets.all(16.0),
  child: InkWell(
    onTap: () {

      navigateTo(context, WebViewScreen(itemMap['url']));

    },

    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageTest(itemMap),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        '${itemMap['title']}',
                        //======= textDirection: TextDirection.rtl,
                        // style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,

                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'Tajawal',
                        ),


                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Text(
                        //   //'${itemMap['publishedAt']}',
                        //   // '${itemMap['publishedAt']}' + " توقيت غرينتش (GMT)",
                        //   //'${itemMap[ DateTime.parse('publishedAt').day]}',
                        //
                        //   '${itemMap['publishedAt']}' + " (GMT)غرينتش",
                        //
                        //   // DateFormat.yMMMd().format(value!)
                        //   // '${DateFormat.yMMMd().format(itemMap['publishedAt'])}',
                        //
                        //   style: TextStyle(
                        //     fontSize: 12,
                        //     color: Colors.grey,
                        //     fontFamily: 'Tajawal',
                        //   ),
                        // ),



                        // ******************
                        Text(
                          // DateFormat.MMMMEEEEd().format(DateTime.now()) + "   " +
                          //     DateFormat.Hms().format(DateTime.now()),

                    '${itemMap['date']}',
                          // ******************
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontFamily: 'Tajawal',
                          ),
                        ),


                      ],
                    ),
                    //
                    // Row(
                    //   children: [
                    //     RawMaterialButton(
                    //       onPressed: () {
                    //
                    //         // NewsCubit.get(context).insertToDatabase;
                    //         // navigateTo(context, WebViewScreen(itemMap['url']));
                    //         // NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}');
                    //
                    //        // NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}');
                    //         NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: DateFormat.MMMMEEEEd().format(DateTime.now()) + "   " +
                    //             DateFormat.Hms().format(DateTime.now()),url:'${itemMap['url']}',);
                    //
                    //         // NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}, image: itemMap['urlToImage']);
                    //       },
                    //       elevation: 3.0,
                    //       fillColor: Colors.white,
                    //       child: Icon(
                    //         Icons.favorite_outline,
                    //         size: 15.0,
                    //       ),
                    //       padding: EdgeInsets.all(7.0),
                    //       shape: CircleBorder(),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),
);


// ========================================


//
// Widget articleItem_01(itemMap, BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: InkWell(
//       onTap: () {
//         navigateTo(context, WebViewScreen(itemMap['url']));
//       },
//
//
//       child: Column(
//         children: [
//
//           Column(
//             children: [
//
//               Text(
//                 '${itemMap['source']['name']}',
//
//
//                 textDirection: TextDirection.rtl,
//                 // style: Theme.of(context).textTheme.bodyText1,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.start,
//
//                 style: TextStyle(
//                   color: Colors.blueGrey,
//                   fontSize: 35,
//                   fontFamily: 'Tajawal',
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             width: 55,
//             height: 25,
//           ),
//           Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: imageTest(itemMap),
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Expanded(
//                 child: Container(
//                   height: 150,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           '${itemMap['title']}',
//                           textDirection: TextDirection.rtl,
//                           // style: Theme.of(context).textTheme.bodyText1,
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.start,
//
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 20,
//                             fontFamily: 'Tajawal',
//                           ),
//
//
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             //'${itemMap['publishedAt']}',
//
//                             // '${itemMap['publishedAt']}' + " توقيت غرينتش (GMT)",
//
//
//                             //'${itemMap[ DateTime.parse('publishedAt').day]}',
//
//
//                             '${itemMap['publishedAt']}' + " (GMT)غرينتش",
//
//
//                             // DateFormat.yMMMd().format(value!)
//
//                             // '${DateFormat.yMMMd().format(itemMap['publishedAt'])}',
//
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               fontFamily: 'Tajawal',
//                             ),
//                           ),
//
//
//
//
//                         ],
//                       ),
//
//
//                       Row(
//                         children: [
//                           RawMaterialButton(
//                             onPressed: () {
//
//                               // NewsCubit.get(context).insertToDatabase;
//
//                               // navigateTo(context, WebViewScreen(itemMap['url']));
//
//                               // NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}');
//
//                               NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}');
//
//                               // NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}, image: itemMap['urlToImage']);
//                             },
//                             elevation: 3.0,
//                             fillColor: Colors.white,
//                             child: Icon(
//                               Icons.favorite_outline,
//                               size: 15.0,
//                             ),
//                             padding: EdgeInsets.all(7.0),
//                             shape: CircleBorder(),
//                           ),
//
//
//                           // RawMaterialButton(
//                           //   onPressed: () {
//                           //
//                           //     // int id1 = await txn.rawInsert(
//                           //     //     'INSERT INTO news(title, date) VALUES("Egypt", "2022-5")');
//                           //     // print('inserted1: $id1');
//                           //
//                           //
//                           //     // BlocProvider(
//                           //     //     create: (BuildContext context) => NewsCubit()
//                           //     //       ..getFavorite()
//                           //     //       ..createDatabase()
//                           //     //
//                           //     // );
//                           //
//                           //
//                           //   },
//                           //   elevation: 3.0,
//                           //   fillColor: Colors.white,
//                           //   child: Icon(
//                           //     Icons.adb_outlined,
//                           //     size: 15.0,
//                           //   ),
//                           //   padding: EdgeInsets.all(7.0),
//                           //   shape: CircleBorder(),
//                           // ),
//
//                         ],
//                       )
//
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
//



//
// Widget articleItem(itemMap, BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: InkWell(
//       onTap: () {
//         navigateTo(context, WebViewScreen(itemMap['url']));
//       },
//
//
//       child: Column(
//         children: [
//
//           Column(
//             children: [
//
//               Text(
//                 '${itemMap['source']['name']}',
//
//
//                  textDirection: TextDirection.rtl,
//                 // style: Theme.of(context).textTheme.bodyText1,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.start,
//
//                 style: TextStyle(
//                   color: Colors.blueGrey,
//                   fontSize: 35,
//                   fontFamily: 'Tajawal',
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             width: 55,
//             height: 25,
//           ),
//           Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: imageTest(itemMap),
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Expanded(
//                 child: Container(
//                   height: 150,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           '${itemMap['title']}',
//                            textDirection: TextDirection.rtl,
//                           // style: Theme.of(context).textTheme.bodyText1,
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.start,
//
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 20,
//                             fontFamily: 'Tajawal',
//                           ),
//
//
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             //'${itemMap['publishedAt']}',
//
//                             // '${itemMap['publishedAt']}' + " توقيت غرينتش (GMT)",
//
//
//                            //'${itemMap[ DateTime.parse('publishedAt').day]}',
//
//
//                             '${itemMap['publishedAt']}' + " (GMT)غرينتش",
//
//
//                             // DateFormat.yMMMd().format(value!)
//
//                            // '${DateFormat.yMMMd().format(itemMap['publishedAt'])}',
//
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               fontFamily: 'Tajawal',
//                             ),
//                           ),
//
//
//
//
//                         ],
//                       ),
//
//
//                       Row(
//                         children: [
//                           RawMaterialButton(
//                             onPressed: () {
//
//                               // NewsCubit.get(context).insertToDatabase;
//
//                               // navigateTo(context, WebViewScreen(itemMap['url']));
//
//                             // NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}');
//
//                              NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}');
//
//                              // NewsCubit.get(context).insertToDatabase(title: '${itemMap['title']}', date: '${itemMap['publishedAt']}, image: itemMap['urlToImage']);
//                             },
//                             elevation: 3.0,
//                             fillColor: Colors.white,
//                             child: Icon(
//                               Icons.favorite_outline,
//                               size: 15.0,
//                             ),
//                             padding: EdgeInsets.all(7.0),
//                             shape: CircleBorder(),
//                           ),
//
//
//                           // RawMaterialButton(
//                           //   onPressed: () {
//                           //
//                           //     // int id1 = await txn.rawInsert(
//                           //     //     'INSERT INTO news(title, date) VALUES("Egypt", "2022-5")');
//                           //     // print('inserted1: $id1');
//                           //
//                           //
//                           //     // BlocProvider(
//                           //     //     create: (BuildContext context) => NewsCubit()
//                           //     //       ..getFavorite()
//                           //     //       ..createDatabase()
//                           //     //
//                           //     // );
//                           //
//                           //
//                           //   },
//                           //   elevation: 3.0,
//                           //   fillColor: Colors.white,
//                           //   child: Icon(
//                           //     Icons.adb_outlined,
//                           //     size: 15.0,
//                           //   ),
//                           //   padding: EdgeInsets.all(7.0),
//                           //   shape: CircleBorder(),
//                           // ),
//
//                         ],
//                       )
//
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget listViewSeparator() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      width: double.infinity,
      color: Colors.grey,
      height: 1,
    ),
  );
}

Widget articleBuilder(List<dynamic> list, {isSearch = false}) {
  return ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) {
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return articleItem(list[index], context);
          },
          separatorBuilder: (context, index) => listViewSeparator(),

          itemCount: 10);
    },
    fallback: (context) =>
        isSearch ? Container() : Center(child: CircularProgressIndicator()),
  );
}



// // *** ****************************
//
// Widget articleBuilder2(List<dynamic> favorite) {
//   return ConditionalBuilder(
//     condition: favorite.length > 0,
//     builder: (context) {
//       return ListView.separated(
//           physics: BouncingScrollPhysics(),
//           itemBuilder: (context, index) {
//              return articleItem(favorite[index], context);
//           },
//           separatorBuilder: (context, index) => listViewSeparator(),
//           itemCount: 10
//       );
//     },
//     fallback: (context) => Container(),
//   );
// }
//
// // *** ****************************

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

Widget defaultFormField(
        {required BuildContext context,
        TextEditingController? controller,
        required String labelText,
        required TextInputType keyboardType,
        required IconData prefixIcon,
        required String? Function(String?)? validator,
        void Function()? onEditingComplete,
        void Function(String)? onChanged,
        VoidCallback? suffixIconOnPressed,
        IconData? suffixIcon,
        bool obscureText = false,
        VoidCallback? onTap,
        Function? onFieldSubmitted // mohem
        }) =>
    TextFormField(
      style: TextStyle(
          color:
              ThemeCubit.get(context).darkMode ? Colors.white : Colors.black),
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      obscureText: obscureText,
      controller: controller!,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeCubit.get(context).darkMode
                    ? Colors.white
                    : Colors.deepOrange)),
        labelStyle: TextStyle(
            color:
                ThemeCubit.get(context).darkMode ? Colors.white : Colors.grey),
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefixIcon,
          color: ThemeCubit.get(context).darkMode
              ? Colors.white
              : Colors.deepOrange,
        ),
        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon: Icon(suffixIcon),
        ),
      ),
      keyboardType: keyboardType,
      // or like this
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: (value) {},
    );

//
// Widget buildNewsItem(Map model,context) => Dismissible(
//   key: Key(model['id'].toString()),
//   onDismissed: (direction) {
//     NewsCubit.get(context).deleteData(id: model['id']);
//   }, child: null,
//
//   // child:   Padding(
//   //
//   //   padding: const EdgeInsets.all(8.0),
//   //
//   //   child: Row(
//   //
//   //     children: [
//   //
//   //       SizedBox(
//   //
//   //         width: 20,
//   //
//   //       ),
//   //
//   //       Expanded(
//   //
//   //         child: Column(
//   //
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //
//   //           mainAxisSize: MainAxisSize.min,
//   //
//   //           children: [
//   //
//   //             Text(
//   //
//   //               '${model['title']}',
//   //
//   //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//   //
//   //               maxLines: 2,
//   //
//   //               overflow: TextOverflow.ellipsis,
//   //
//   //             ),
//   //
//   //             SizedBox(
//   //
//   //               height: 10,
//   //
//   //             ),
//   //
//   //             Text(
//   //
//   //               '${model['date']}',
//   //
//   //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.grey),
//   //
//   //
//   //
//   //             ),
//   //
//   //           ],
//   //
//   //         ),
//   //
//   //       ),
//   //
//   //       // SizedBox(
//   //       //
//   //       //   width: 20,
//   //       //
//   //       // ),
//   //
//   //       // IconButton(onPressed: () {
//   //       //
//   //       //   AppCubit.get(context).updateData(status: 'done', id: model['id']);
//   //       //
//   //       // }, icon: Icon(Icons.check_circle),color: Colors.green,),
//   //
//   //
//   //     ],
//   //
//   //   ),
//   //
//   // ),
//
// );


// Widget buildNewsItem(Map model,context) => Dismissible(
// key: Key(model['id'].toString()),
// onDismissed: (direction) {
// NewsCubit.get(context).deleteData(id: model['id']);
// }, child: null,
// );