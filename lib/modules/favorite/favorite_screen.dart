import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapi_01/layout/news_app/news_cubit/cubit.dart';
import 'package:newsapi_01/layout/news_app/news_cubit/states.dart';
import 'package:newsapi_01/modules/business/business_screen.dart';
import 'package:newsapi_01/modules/web_view/web_view_screen.dart';
import 'package:newsapi_01/shared/components/components.dart';

class FavoriteScreen extends StatelessWidget {

 // var searchFormFieldController = TextEditingController();

  // @override
  // Widget build(BuildContext context) {
  //   return BlocConsumer<NewsCubit, NewsStates>(
  //     listener: (context, state) {
  //
  //     },
  //     builder: (context, state) {
  //       List<dynamic>? list = NewsCubit.get(context).favorite;
  //       // return articleBuilder(list);
  //
  //
  //       // return Container(
  //       //   decoration: BoxDecoration(
  //       //     color: Colors.blueGrey,
  //       //   ),
  //       // );
  //
  //       return Column(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(16.0),
  //               child: defaultFormField(
  //                 context: context,
  //                 // controller: searchFormFieldController,
  //                 labelText: 'favorite',
  //                 keyboardType: TextInputType.text,
  //                 prefixIcon: Icons.search,
  //                 validator: (String? value) {
  //                   if (value!.isEmpty) {
  //                    return 'favorite .... ';
  //                    // Expanded(child: articleBuilder(list));
  //
  //                   }
  //                  //  return null;
  //                 },
  //                 onChanged: (String? getTasksFromDatabase) {
  //                   NewsCubit.get(context).getNewsFromDatabase('newstest.db');
  //                 },
  //               ),
  //             ),
  //             Expanded(child: articleBuilder(list)),
  //           ],
  //       );
  //
  //
  //     },
  //   );
  // }

  // *************************

  // ******************

  //
  // @override
  // Widget build(BuildContext context) {
  //   return BlocConsumer<NewsCubit, NewsStates>(
  //     listener: (context, state) {},
  //     builder: (context, state) {
  //       List<dynamic>? tasks = NewsCubit.get(context).favorite;
  //       // return articleBuilder(list);
  //       // var tasks = NewsCubit.get(context).favorite;
  //       if (tasks.length > 0) {
  //         return ListView.separated(
  //             itemBuilder: (context, index) =>
  //                // FavoriteScreen(tasks[index], context),
  //             articleBuilder(tasks),
  //             separatorBuilder: (context, index) => Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //               child: Container(
  //                 color: Colors.grey[300],
  //                 height: 1,
  //                 width: double.infinity,
  //               ),
  //             ),
  //             itemCount: tasks.length);
  //       } else {
  //         Animation<double> progress;
  //         return Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Center(
  //                 child: Icon(
  //                   Icons.list_rounded,
  //                   color: Colors.grey,
  //                   size: 120,
  //                 )),
  //             Text(
  //               'No tasks Yet, Please Add Some Tasks',
  //               style:
  //               TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,wordSpacing: 8),
  //             )
  //           ],
  //         );
  //       }
  //     },
  //   );
  // }




//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NewsCubit, NewsStates>(
//       listener: (context, state) {
//
//       },
//       builder: (context, state) {
//         List<dynamic> list = NewsCubit.get(context).favorite;
//        // return articleBuilder2(list);
//
//
//         // return Padding(
//         //   padding: const EdgeInsets.all(12.0),
//         //   child: SingleChildScrollView(
//         //     child: Container(
//         //         color: Colors.blue,
//         //         height: 8000,
//         //         width: MediaQuery.of(context).size.width,
//         //         // child: Text('${list}'),
//         //         child: Column(
//         //           children: [
//         //             Text(list.toString()),
//         //
//         //             Text('ffff'),
//         //
//         //
//         //           ],
//         //         ),
//         //
//         //
//         //     ),
//         //   ),
//         // );
//
//
//
//
//         return ListView.separated(
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//
//
//              // articleItem(list[index], context);
//
//               return Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: SingleChildScrollView(
//                         child: Container(
//                             color: Colors.white,
//                             // height: 8000,
//                             width: MediaQuery.of(context).size.width,
//                             // child: Text('${list}'),
//                             child: InkWell(
//                               onTap: (){
//
//                                // Navigator.pop(context);
//                               },
//                               child: Card(
//                                 child: Column(
//                                   children: [
//
//                                 // SizedBox(
//                                 //   height: 5,
//                                 // ),
//                                 //     Text(list.toString(),
//                                 //       style: TextStyle(
//                                 //         fontFamily: 'Cairo',
//                                 //         color: Colors.black,
//                                 //         fontWeight: FontWeight.bold,
//                                 //         fontSize: 20
//                                 //     ),
//                                 //     textDirection: TextDirection.rtl,),
//                                 //     SizedBox(
//                                 //   height: 60,
//                                 // ),
//                                 //     Text('End to favorite'),
//                                 //
//                                 //     SizedBox(
//                                 //       height: 30,
//                                 //     ),
//
//
//                           //       Text(list[2]['title'],
//                           //           style: TextStyle(
//                           //           fontFamily: 'Cairo',
//                           //           color: Colors.black,
//                           //           fontWeight: FontWeight.bold,
//                           //           fontSize: 20
//                           //       ),
//                           // textDirection: TextDirection.rtl,),
//                           //       Text(list[2]['date'],
//                           //         style: TextStyle(
//                           //             fontFamily: 'Cairo',
//                           //             color: Colors.black,
//                           //             fontWeight: FontWeight.bold,
//                           //             fontSize: 20
//                           //         ),
//                           //         textDirection: TextDirection.rtl,),
//                           //
//
//
// // *****************************
//
//                                  // Text(list[index]['title']??"",
//                                  Text(list[index]['title']??"name",
//                                    style: TextStyle(
//                                        fontFamily: 'Cairo',
//                                        color: Colors.black,
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: 20
//                                    ),
//                                    textDirection: TextDirection.rtl,),
//
//                                 // Text(list[index]['date']??"",
//                                  Text(list[index]['date']??"2022-5",
//                                    style: TextStyle(
//                                        fontFamily: 'Cairo',
//                                        color: Colors.blue,
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: 20
//                                    ),
//                                    textDirection: TextDirection.rtl,),
//
//                                    // listViewSeparator(),
//
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//
//
//
//                                   ],
//                 ),
//                               ),
//                             ),
//                         ),
//                             ),
//               );
//
//               // return (list[index]['title']);
//             },
//             separatorBuilder: (context, index) => Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Container(
//                 width: double.infinity,
//                 color: Colors.blue,
//                 height: 1,
//               ),
//             ),
//
//             // itemCount: list.length);
//             itemCount: list.length);
//
//         // list.forEach((row) => print(row));
//
//
//       },
//     );
//   }
//


  // Future<int> remove(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete('news'), where: 'id=?' , whereArgs:[id];
  // }

// //*********************
// //*********************
// //*********************
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NewsCubit, NewsStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//        // ******* List<dynamic> list = NewsCubit.get(context).favorite;
//         // List<dynamic> list = NewsCubit.get(context).favorite;
//         List<dynamic> list = NewsCubit.get(context).favorite;
//         if (list.length > 0 ) {
//
//           return ListView.separated(
//               physics: BouncingScrollPhysics(),
//               itemBuilder: (context, index) =>
//                  // *****   articleItem(list[index], context);
//             // articleItem(list[index], context),
//               articleItem(list[index], context),
//               separatorBuilder: (context, index) =>
//                Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: SingleChildScrollView(
//                     child: Container(
//                       color: Colors.white,
//                       // height: 8000,
//                       width: MediaQuery.of(context).size.width,
//                       // child: Text('${list}'),
//                       child: InkWell(
//                         onTap: (){
//                           // Navigator.pop(context);
//                         },
//                         child: Card(
//                           child: Column(
//                             children: [
//                               Text(list[index]['title']??"name",
//                                 style: TextStyle(
//                                     fontFamily: 'Cairo',
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20
//                                 ),
//                                 textDirection: TextDirection.rtl,),
//
//                               // Text(list[index]['date']??"",
//                               Text(list[index]['date']??"2022-5",
//                                 style: TextStyle(
//                                     fontFamily: 'Cairo',
//                                     color: Colors.blue,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20
//                                 ),
//                                 textDirection: TextDirection.rtl,),
//                               SizedBox(
//                                 height: 15,
//                               ),
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//           itemCount: list.length);
//              // },
//               // articleItem(list[index], context),
//
//
//
//         } else {
//
//
//           // Animation<double> progress;
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                   child: Icon(
//                     Icons.list_rounded,
//                     color: Colors.grey,
//                     size: 120,
//                   )),
//               Text(
//                 'لا يوجد أخبار فى المفضلة من فضلك قم بلإضافة',
//                 style:
//                 TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,wordSpacing: 10, fontFamily: 'Cairo', ),
//               )
//             ],
//           );
//
//         }
//
//       },
//     );
//   }


//*********************
//*********************
//*********************

//*********************
//*********************
//*********************


//*********************
//*********************
//*********************


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // ******* List<dynamic> list = NewsCubit.get(context).favorite;
        // List<dynamic> list = NewsCubit.get(context).favorite;
        //List <Map<String, dynamic>> list = NewsCubit.get(context).favorite;
        // var list = NewsCubit.get(context).favorite;

        List<dynamic> list = NewsCubit.get(context).favorite;

        if (list.length > 0 ) {

          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
              // *****   articleItem(list[index], context);
              // articleItem(list[index], context),
              // ***** articleItem_2(list[index]['id'], context),

              //==========================

              articleItem_2(list[index], context),
             separatorBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        // height: 8000,
                        width: MediaQuery.of(context).size.width,
                        // child: Text('${list}'),
                        child: InkWell(
                          onTap: (){
                            // Navigator.pop(context);
                            // navigateTo(context, WebViewScreen(list[index]['title']));

                          },
                          child: Card(
                            // child: Column(
                            //   children: [
                            //     Text(list[index]['title']??"name",
                            //       style: TextStyle(
                            //           fontFamily: 'Cairo',
                            //           color: Colors.black,
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 20
                            //       ),
                            //       textDirection: TextDirection.rtl,),
                            //
                            //     // Text(list[index]['date']??"",
                            //     Text(list[index]['date']??"2022-5",
                            //       style: TextStyle(
                            //           fontFamily: 'Cairo',
                            //           color: Colors.blue,
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 20
                            //       ),
                            //       textDirection: TextDirection.rtl,),
                            //     SizedBox(
                            //       height: 15,
                            //     ),
                            //
                            //   ],
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
              itemCount: list.length,
            );
          // },
          // articleItem(list[index], context),



        } else {


          // Animation<double> progress;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Icon(
                    Icons.list_rounded,
                    color: Colors.grey,
                    size: 120,
                  )),
              Text(
                'لا يوجد أخبار فى المفضلة من فضلك قم بلإضافة',
                style:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,wordSpacing: 6, fontFamily: 'Cairo', ),
              )
            ],
          );

        }

      },
    );
  }


}
