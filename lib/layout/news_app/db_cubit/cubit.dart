import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi_01/layout/news_app/db_cubit/states.dart';


import 'package:sqflite/sqflite.dart';


class dbCubit extends Cubit<dbStates> {
  dbCubit() : super(dbInitialStates());

  static dbCubit get(context) => BlocProvider.of(context);




  // ============= favorite ============


  late Database dataBase;
  // List<Map> favorite = [];
  // List<dynamic> favorite = [];
  // List<Map> favorite = [];
  List <Map<String, dynamic>> favorite = [];

  // List<dynamic> politic = [];

  // List<dynamic> favorite = [];

  void getFavorite() {

    emit(dbGetFavoriteLoadingState());

    emit(dbGetDatabaseState());

    print('inserted successfully getFavorite');

  }


  // =========================================

  // =========================================


  void createDatabase() {
    openDatabase(
      'newstest.db',
      version: 5,
      onCreate: (database, version) {
        print('database created');
        // database.execute('CREATE TABLE news (id INTEGER PRIMARY KEY, title TEXT, date TEXT, image BLOB)')
        database.execute('CREATE TABLE news (id INTEGER PRIMARY KEY, title TEXT, date TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('error while creating table ${error.toString()}');
        });
      },
      onOpen: (dataBase) {
        getNewsFromDatabase(dataBase);
        print('table opened');
      },
    ).then((value) {
      dataBase = value;
      emit(dbCreateDatabaseState());
    });
  }

  void getNewsFromDatabase(database) {
    favorite = [];

    database.rawQuery('SELECT * FROM news ').then((value) {
      value.forEach((element) {
        favorite.add(element);
      });

      emit(dbGetDatabaseState());
    });
  }

  Future insertToDatabase({
    required String title,
    required String date,

    // required String image,

  }) async {
    return await dataBase.transaction((txn) async {
      // txn.rawInsert('INSERT INTO news(title, date, image) VALUES("$title", "$date", "$image")')
      txn.rawInsert('INSERT INTO news(title, date) VALUES("$title", "$date")')
          .then((value) {
        print('$value inserted successfully');
        emit(dbInsertDatabaseState());

        getNewsFromDatabase(dataBase);
      }).catchError((error) {
        print(' error when inserting new record ${error.toString()}');
      });
    });
  }


  void deleteData({ required int id}) {
    dataBase.rawDelete('DELETE FROM news where id = ?',
        [id]).then((value) {
      getNewsFromDatabase(dataBase);
      emit(dbDeleteDatabaseState());
    });
  }


}
