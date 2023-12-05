import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "loans.db";
  static const _databaseVersion = 1;

  static const userTable = 'users';
  static const columnId = '_id';
  static const userColumnName = 'name';
  static const userColumnLastName = 'last_name';
  static const userColumnEmail = 'email';
  static const userColumnPassword = 'password';
  static const userColumnBirthdate = 'birthdate';
  static const userColumnEducation = 'education';
  static const userColumnINE = 'ine';
  static const userColumnCurrentWork = 'work';
  static const userColumnEarnings = 'earnings';
  static const userColumnModalityWork = 'modality_work';
  static const userColumnMaxLoan = 'max_loan_amount';

  static const accountsTable = 'accounts';
  static const columnUserId = 'user_id';
  static const accountsColumnNumber = 'number';
  static const accountsColumnBank = 'bank';
  static const accountsColumnFullname = 'fullname';
  static const accountsColumnAlias = 'alias';

  static const loansTable = 'loans';
  static const loansColumnName = 'name';
  static const loansColumnAmount = 'amount';
  static const loansColumnCat = 'cat';
  static const loansColumnPeriodPayment = 'period_payment';
  static const loansColumnNumberPayments = 'number_payment';
  static const loansColumnPaymentPlan = 'payment_plan';
  static const loansColumnTotalCharges = 'total_charges';
  static const loansColumnLimitDatePayment = 'limit_date';
  static const loansColumnAccountTransfer = 'account_transfer';
  static const loansColumnReason = 'reason';
  static const loansColumnRequestedDate = 'requested_date';
  static const loansColumnStatus = 'status';

  static const paymentsTable = 'payments';
  static const paymentsColumnLoan = 'load_id';
  static const paymentsColumnAmount = 'amount';
  static const paymentsColumnNumber = 'number';
  static const paymentsColumnLimitDate = 'limit_date';
  static const paymentsColumnPaymentDate = 'payment_date';

  static const transactionsTable = 'transactions';
  static const transactionsColumnName = 'name';
  static const transactionsColumnDate = 'date';

  late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $userTable (
             $columnId INTEGER PRIMARY KEY,
             $columnUserId int(11) NOT NULL,
             $userColumnName TEXT NOT NULL,
             $userColumnLastName TEXT NOT NULL,
             $userColumnEmail varchar(255) NOT NULL UNIQUE,
             $userColumnPassword TEXT NOT NULL,
             $userColumnBirthdate TEXT NOT NULL,
             $userColumnEducation TEXT NOT NULL,
             $userColumnINE TEXT NOT NULL,
             $userColumnCurrentWork TEXT NOT NULL,
             $userColumnEarnings TEXT NOT NULL,
             $userColumnModalityWork TEXT NOT NULL,
             $userColumnMaxLoan TEXT NOT NULL,
          ),

         CREATE TABLE $accountsTable (
            $columnId INTEGER PRIMARY KEY,
            $columnUserId int(11) NOT NULL,
            $accountsColumnNumber TEXT NOT NULL,
            $accountsColumnBank TEXT NOT NULL,
            $accountsColumnFullname TEXT NOT NULL,
            $accountsColumnAlias TEXT NOT NULL,
         ),

          CREATE TABLE $loansTable (
            $columnId INTEGER PRIMARY KEY,
            $columnUserId int(11) NOT NULL,
            $loansColumnName TEXT NOT NULL,
            $loansColumnAmount TEXT NOT NULL,
            $loansColumnCat TEXT NOT NULL,
            $loansColumnPeriodPayment TEXT NOT NULL,
            $loansColumnNumberPayments int(11) NOT NULL,
            $loansColumnPaymentPlan TEXT NOT NULL,
            $loansColumnTotalCharges TEXT NOT NULL,
            $loansColumnLimitDatePayment DATE NOT NULL,
            $loansColumnAccountTransfer int(11) NOT NULL,
            $loansColumnReason TEXT NOT NULL,
            $loansColumnRequestedDate DATE NOT NULL,
            $loansColumnStatus TEXT NOT NULL,
         ),


          CREATE TABLE $paymentsTable (
            $columnId INTEGER PRIMARY KEY,
            $columnUserId int(11) NOT NULL,
            $paymentsColumnLoan int(11) NOT NULL,
            $paymentsColumnAmount TEXT NOT NULL,
            $paymentsColumnNumber int(11) NOT NULL,
            $paymentsColumnLimitDate DATE NOT NULL,
            $paymentsColumnPaymentDate DATETIME NOT NULL,
         ),


          CREATE TABLE $transactionsTable (
            $columnId INTEGER PRIMARY KEY,
            $columnUserId int(11) NOT NULL,
            $transactionsColumnName TEXT NOT NULL,
            $transactionsColumnDate DATETIME NOT NULL,
         ),


          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insertUser(String table, Map<String, dynamic> row) async {
    return await _db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows(
    String table,
  ) async {
    return await _db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount(
    String table,
  ) async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(String table, Map<String, dynamic> row) async {
    int id = row[columnId];
    return await _db.update(
      table,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(String table, int id) async {
    return await _db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}