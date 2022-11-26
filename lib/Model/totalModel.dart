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
        GROUP BY 'data' 
     ''');
    return res;
  }

  Future getOutlaysOfdAY(String date) async {
    List<Map> res = await sqlDB.readData(''' SELECT * FROM 'outly'
        where data='$date' 
     ''');
    return res;
  }
}
