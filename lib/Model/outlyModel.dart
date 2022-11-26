import 'package:super_market/DataBase/sqlDB.dart';

class OutlyModel {
  SqlDB sqlDB = SqlDB();

  Future addNewOutly(Map<String, Object?> data) async {
    int res = await sqlDB.post("outly", data);

    return res;
  }

  Future getTotal(String date) async {
    List<Map> res =
        await sqlDB.readData(''' SELECT total_date,SUM(amount) FROM 'outly' 
        WHERE total_date = '$date' 
     ''');
    return res;
  }

  Future getAllOutly(String date) async {
    List<Map> res = await sqlDB
        .readData("SELECT * FROM 'outly'  WHERE total_date = '$date'");
    return res;
  }

  Future deleteOutly(id) async {
    int res = await sqlDB.delete("outly", " id = $id ");
    return res;
  }

  Future editOutly(int id, Map<String, Object?> data) async {
    int res = await sqlDB.update("outly", data, " id = $id ");
    return res;
  }
}
