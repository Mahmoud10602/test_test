abstract class dbStates {}

class dbInitialStates extends dbStates {}

// ============ ============================

// ============ DB ============================

class dbCreateDatabaseState extends dbStates {}

class dbInsertDatabaseState extends dbStates {}


class dbGetDatabaseState extends dbStates {}

//  -----------------------

class dbUpdateDatabaseState extends dbStates {}

class dbDeleteDatabaseState extends dbStates {}



// ************************


// ============ ==========================



class dbGetFavoriteLoadingState extends dbStates {}

class dbGetFavoriteSuccessState extends dbStates {}

class dbGetFavoriteErrorState extends dbStates {
  final String error;

  dbGetFavoriteErrorState(this.error);
}

// ============ ============================