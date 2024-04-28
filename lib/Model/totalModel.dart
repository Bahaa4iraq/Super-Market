import 'package:super_market/DataBase/sqlDB.dart';

class TotalModel {
  SqlDB sqlDB = SqlDB();

  Future getTotal() async {
    List<Map> res =
        await sqlDB.readData(''' SELECT total_date,SUM(amount) FROM 'outly'
     GROUP BY total_date ''');
    return res;
  }

  Future getOutlaysOfMonth(String date) async {
    List<Map> res =
        await sqlDB.readData(''' SELECT data,SUM(amount) FROM 'outly'
        where total_date='$date' GROUP BY 'data'  
     ''');
    return res;
  }

  Future getOutlaysOfdAY(String date) async {
    List<Map> res = await sqlDB.readData(''' SELECT * FROM 'outly'
        where data='$date' 
     ''');
    return res;
  }

  Future setBackUpVacuum(String date) async {
    List<Map> res =
        await sqlDB.readData(''' VACUUM main INTO '$date/chinook_backup.db'
     ''');
    return res;
  }

  Future setRestoreVacuum(String date) async {
    List<Map> res =
        await sqlDB.readData(''' VACUUM '$date/chinook_backup.db'  INTO main
     ''');
    return res;
  }

  void backUpData() async {
    await sqlDB.backUpDataBase();
  }
}
