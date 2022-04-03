import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapi_01/layout/news_app/news_cubit/states.dart';
import 'package:newsapi_01/modules/business/business_screen.dart';
import 'package:newsapi_01/modules/favorite/favorite_screen.dart';
import 'package:newsapi_01/modules/politic/politic_screen.dart';
import 'package:newsapi_01/modules/science/science_screen.dart';

import 'package:newsapi_01/modules/sports/sports_screen.dart';

import 'package:newsapi_01/shared/network/remote/dio_helper.dart';

import 'package:sqflite/sqflite.dart';

// Your API key is: fc756aac292e4747b42e87cd0d32f468
// Your API key is: f441828e39ba4e18b4586f82da076163
//  Your API key is: de21002cb90342e39bf3df583abc5bc7

// *******************************
// *******************************

//  'apiKey': '51a9f57bf74c47cea9b01dbd8f3bdca2',
//  'apiKey': '9ae7535625f2490b81dfdf1283fefc95',
//  'apiKey': 'fc756aac292e4747b42e87cd0d32f468',
//  'apiKey': 'f441828e39ba4e18b4586f82da076163',
//  'apiKey': 'de21002cb90342e39bf3df583abc5bc7',

var apikey = 'f441828e39ba4e18b4586f82da076163';

// *******************************
// *******************************
// *******************************
// *******************************
// ************** ***************************
// Your API key is: 2e134692b72540c18f2de4710b70c293
// ************** ***************************
// Your API key is: 9bc64cb9d5be4e0faf5a79fd1c8dc676
// ************** ***************************
// Your API key is: ae0902b47113437faae052e344a9d658
// ************** ***************************
// *******************************
// *******************************
// *******************************


// ********************************

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 4;
  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline),
      label: 'المفضلة',
      tooltip: 'الاخبار المفضلة',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.wallet_membership_outlined),
      label: 'السياسة',
      tooltip: 'الاخبار الحصرية',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'الرياضة',
      tooltip: 'الاخبار الحصرية',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'العلوم',
      tooltip: 'الاخبار الحصرية',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center_outlined),
      label: 'الاعمال',
      tooltip: 'الاخبار الحصرية',
    ),
  ];

  List<Widget> screens = [
    FavoriteScreen(),
    PoliticScreen(),
    SportsScreen(),
    ScienceScreen(),
    BusinessScreen(),
  ];

  void changeBottomNavBarIndex(index) {
    currentIndex = index;
    emit(ChangeNewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        // 'apiKey': '51a9f57bf74c47cea9b01dbd8f3bdca2',
        // 'apiKey': '9ae7535625f2490b81dfdf1283fefc95',
       // 'apiKey': 'fc756aac292e4747b42e87cd0d32f468',
      //  'apiKey': 'f441828e39ba4e18b4586f82da076163',
       // 'apiKey': 'de21002cb90342e39bf3df583abc5bc7',

        'apiKey': apikey,
      },
    ).then((value) {
      business = value.data['articles'];
      print(value.data['articles'][0]['title']);


      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error.toString()));
      print('get data error :*: ${error.toString()} :*:');
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      // 'apiKey': '51a9f57bf74c47cea9b01dbd8f3bdca2',
      // 'apiKey': '9ae7535625f2490b81dfdf1283fefc95',
     // 'apiKey': 'fc756aac292e4747b42e87cd0d32f468',
     // 'apiKey': 'f441828e39ba4e18b4586f82da076163',
     //  'apiKey': 'de21002cb90342e39bf3df583abc5bc7',

      'apiKey': apikey,

    }).then((value) {
      sports = value.data['articles'];
      print(value.data['articles'][0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      emit(NewsGetSportsErrorState(error));
      print('get data error :*: ${error.toString()} :*:');
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      // 'apiKey': '51a9f57bf74c47cea9b01dbd8f3bdca2',
      // 'apiKey': '9ae7535625f2490b81dfdf1283fefc95',
     // 'apiKey': 'fc756aac292e4747b42e87cd0d32f468',
    //  'apiKey': 'f441828e39ba4e18b4586f82da076163',
     // 'apiKey': 'de21002cb90342e39bf3df583abc5bc7',

      'apiKey': apikey,

    }).then((value) {
      science = value.data['articles'];
      print(value.data['articles'][0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      emit(NewsGetScienceErrorState(error));
      print('get data error :*: ${error.toString()} :*:');
    });
  }

  List<dynamic> search = [];

  void getSearch(String? searchValue) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$searchValue',
      // 'apiKey': '51a9f57bf74c47cea9b01dbd8f3bdca2',
     //  'apiKey': '9ae7535625f2490b81dfdf1283fefc95',
     // 'apiKey': 'fc756aac292e4747b42e87cd0d32f468',
     // 'apiKey': 'f441828e39ba4e18b4586f82da076163',
    //  'apiKey': 'de21002cb90342e39bf3df583abc5bc7',

      'apiKey': apikey,


    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorState(error.toString()));
      print('get data error :*: ${error.toString()} :*:');
    });
  }


  // ================== =================================


  List<dynamic> politic = [];

  void getPolitic() {
    emit(NewsGetPoliticLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'politics',
        // 'apiKey': '51a9f57bf74c47cea9b01dbd8f3bdca2',
        // 'apiKey': '9ae7535625f2490b81dfdf1283fefc95',
        // 'apiKey': 'fc756aac292e4747b42e87cd0d32f468',
       // 'apiKey': 'f441828e39ba4e18b4586f82da076163',
       // 'apiKey': 'de21002cb90342e39bf3df583abc5bc7',

        'apiKey': apikey,

      },
    ).then((value) {
      politic = value.data['articles'];
      print(value.data['articles'][0]['title']);

      emit(NewsGetPoliticSuccessState());
    }).catchError((error) {
      emit(NewsGetPoliticErrorState(error.toString()));
      print('get data error :*: ${error.toString()} :*:');
    });
  }


  // ============= favorite ============


  // late Database dataBase = dataBase.rawInsert('INSERT INTO news(title, date) VALUES("Egypt", "2022-5")') as Database;

   Database? dataBase;
  // List<Map> favorite = [];
  // List<dynamic> favorite = [];
  // List<Map> favorite = [];
  List <Map<String, dynamic>> favorite = [];

  // List<dynamic> politic = [];

  // List<dynamic> favorite = [];

  void getFavorite() {

   // ****** insertToDatabase(title: "Egypt 6", date: "2022-10");

    emit(NewsGetFavoriteLoadingState());

    emit(AppGetDatabaseState());

    print('inserted successfully getFavorite');
    // DioHelper.getData(
    //   url: 'v2/top-headlines',
    //   query: {
    //     'country': 'eg',
    //     'category': 'politics',
    //     'apiKey': '51a9f57bf74c47cea9b01dbd8f3bdca2',
    //   },
    // ).then((value) {
    //   politic = value.data['articles'];
    //   print(value.data['articles'][0]['title']);
    //
    //   emit(NewsGetFavoriteSuccessState());
    // }).catchError((error) {
    //   emit(NewsGetFavoriteErrorState(error.toString()));
    //   print('get data error :*: ${error.toString()} :*:');
    // });
  }


  // =========================================


  void createDatabase() {
    openDatabase(
      'newstest.db',
      version: 6,
      onCreate: (database, version) {
        print('database created');
        // database.execute('CREATE TABLE news (id INTEGER PRIMARY KEY, title TEXT, date TEXT, image BLOB)')
        database.execute('CREATE TABLE news (id INTEGER PRIMARY KEY, title TEXT, date TEXT , url Text )')


       // ***** insertToDatabase(title: "Egypt 4", date: "2022-8")
            .then((value) {
          print('table created');

        }).catchError((error) {
          print('error while creating table ${error.toString()}');
        });
      },
        // database.rawInsert('INSERT INTO news(title, date) VALUES("Egypt", "2022-5")')
      onOpen: (dataBase) {

        // *****  insertToDatabase(title: "Egypt 5", date: "2022-9");

        getNewsFromDatabase(dataBase);
        print('table opened');
      },
    ).then((value) {
      // insertToDatabase(title: "Egypt 3", date: "2022-7")
      dataBase = value;
      emit(AppCreateDatabaseState());
    });
  }

  void getNewsFromDatabase(database) {
    favorite = [];

    // *****  insertToDatabase(title: "Egypt 3", date: "2022-7");
    database.rawQuery('SELECT * FROM news ').then((value) {
      value.forEach((element) {
        favorite.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }



  Future insertToDatabase({
    required String title,
    required String date,
    required String url,

    // required String image,

  }) async {
    return  dataBase?.transaction((txn)  async {
      // txn.rawInsert('INSERT INTO news(title, date, image) VALUES("$title", "$date", "$image")')

      // *****  // int id1 = await txn.rawInsert(
      //     'INSERT INTO news(title, date) VALUES("Egypt", "2022-5")');
      // print('inserted1: $id1');

      // txn.rawInsert('INSERT INTO news(title, date) VALUES("$title", "DateFormat.MMMMEEEEd().format(DateTime.now()) + "   " + DateFormat.Hms().format(DateTime.now())")')
      txn.rawInsert('INSERT INTO news(title, date, url) VALUES("$title", "$date", "$url" )')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getNewsFromDatabase(dataBase);
      }).catchError((error) {
        print(' error when inserting new record ${error.toString()}');
      });
    });
  }


  // ********


  Future insertToDatabaseManual({
    required String title,
    required String date,
    required String url,


    // required String image,

  }) async {
    return await dataBase?.transaction((txn) async {
      txn.rawInsert('INSERT INTO news(title, date, url) VALUES("$title", "$date", "$url" )')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getNewsFromDatabase(dataBase);
      }).catchError((error) {
        print(' error when inserting new record ${error.toString()}');
      });
    });
  }

  // *********

  void deleteData({ required int id}) {
    dataBase?.rawDelete('DELETE FROM news where id = ?',
        [id]).then((value) {
      getNewsFromDatabase(dataBase);
      emit(AppDeleteDatabaseState());
    });
  }

// *********
// *********


  void deleteData_2({ required String id}) {
    dataBase?.rawDelete('DELETE FROM news where id = ?',
        [id]).then((value) {
      getNewsFromDatabase(dataBase);
      emit(AppDeleteDatabaseState());
    });
  }


// *********
// *********
// *********

//=========== =====================

// bool isBottomSheetShown = false;
// IconData fabIcon = Icons.edit;



// void updateData({required String status, required int id}) {
//   dataBase.rawUpdate('UPDATE tasks SET status = ? where id = ?',
//       ['$status', id]).then((value) {
//     getTasksFromDatabase(dataBase);
//     emit(AppUpdateDatabaseState());
//   });
// }
//
// void deleteData({ required int id}) {
//   dataBase.rawDelete('DELETE FROM tasks where id = ?',
//       [id]).then((value) {
//     getTasksFromDatabase(dataBase);
//     emit(AppDeleteDatabaseState());
//   });
// }
//

// ================ ==========================



// ====================


  // static IconData fabIcon =  Icons.favorite_outline;
  // static IconData? fabIcon;

  //  IconData fabIcon =  Icons.favorite_outline;
  //  bool isFabIconShown = false;
  //
  //  void changeFabIconState({required bool isShow, required IconData icon}) {
  //   // fabIcon = icon;
  //   // if (icon) {
  //   //   fabIcon = Icons.favorite_outline;
  //   // } else {
  //   //   fabIcon = Icons.favorite_sharp;
  //   // }
  //
  //    isFabIconShown = isShow;
  //    fabIcon = icon;
  //   emit(AppFabIconState());
  // }


// ====================

 // IconData fabIcon =  Icons.favorite_outline;


  // // ====================
  // // ====================
  //
  // IconData fabIcon2 =  Icons.favorite_sharp;
  //
  //  void changeFabIconState2({required IconData icon}) {
  //     fabIcon2 = icon;
  //     emit(AppFabIconState2());
  // }
  //
  //   // ====================
  //   // ====================


//  void icontest() {
//   Row(
//     children: [
//       RawMaterialButton(onPressed: () {  },
//         child: Icon(Icons.favorite_sharp,
//           size: 15.0, color: Colors.blue,),
//         padding: EdgeInsets.all(7.0),
//         shape: CircleBorder(),
//       ),
//     ],
//   );
//   emit(IconTest());
// }

// =====================


  // IconData fabIcon =  Icons.favorite_sharp;
  // int sizea = 25;
  // bool fabIcon4 = true;
  //
  // void changeFabIconState({required IconData icon ,required size}) {
  //   // fabIcon = icon;
  //   fabIcon4 ? Icons.favorite_outline : fabIcon = Icons.favorite_sharp;
  //   sizea = size;
  //   emit(AppFabIconState());
  // }


// =======================

  // // IconData fabIcon2 =  Icons.favorite_sharp;
  // IconData? fabIcon2;
  // void changeFabIconState5() {
  //   fabIcon2 = Icons.favorite_sharp;
  //   emit(AppFabIconState5());
  // }
// =======================
// =======================

  // IconData fabIcon =  Icons.favorite_sharp;
  // int sizea = 25;
  // bool fabIcon4 = true;
  // Color color = Colors.blue;
  // void changeFabIconState5({required IconData icon ,required size, required color}) {
  //   // fabIcon = icon;
  //   fabIcon4 ? Icons.favorite_outline : fabIcon = Icons.favorite_sharp;
  //   sizea = size;
  //   color = color;
  //   emit(AppFabIconState5());
  // }

// ---------------------------

  // IconData fabIcon =  Icons.favorite_sharp;
  // void changeFabIconState6() {
  //   Container(
  //     color: Colors.blue,
  //     height: 200,
  //     width: 200,
  //     child: Center(
  //         child: Icon(
  //           Icons.favorite_sharp,
  //           color: Colors.green,
  //           size: 120,
  //         )),
  //   );
  //   // fabIcon = icon;
  //   // fabIcon =  Icons.favorite_sharp;
  //   emit(AppFabIconState6());
  // }

// ******************************

  // IconData fabIcon =  Icons.favorite_sharp;
  // bool fabIcon4 = false;
  // void changeFabIconState6() {
  //   fabIcon4 = true;
  //   fabIcon =  Icons.adb_outlined;
  //   emit(ThemeModeChangedState());
  // }
  //



  // **********************************

  // fabIcon = icon;
  // fabIcon =  Icons.favorite_sharp;
  // emit(AppFabIconState6());

// ****************
// ****************
//
//   bool darkMode = false;
//   void changeThemeMode({bool? isDark}) {
//     if (isDark != null) {
//       darkMode = isDark;
//       emit(ThemeModeChangedState());
//     } else {
//       darkMode = !darkMode;
//       emit(ThemeModeChangedState());
//     }
//   }

//**************************************

  //
  //   bool darkMode = false;
  // Color color = Colors.lightGreen;
  // void changeThemeMode() {
  // // void changeThemeMode({Color? color}) {
  //   color = Colors.blue;
  //     // color = Colors.lightGreen;
  //     emit(ThemeModeChangedState());
  //   }
  //


  // *******************************************


  bool fabIcon6 = false;
  IconData fabIcon5 = Icons.edit;

  void changeBottomSheetState({required bool isShow, required IconData icon}) {
    fabIcon6 = isShow;
    fabIcon5 = icon;
    emit(ThemeModeChangedState());
   // fabIcon6 = false;
  }


  //  ********************************************


    // void buttonViewSeparator() {
    // emit(ButtonViewSeparator());
    // }



}
