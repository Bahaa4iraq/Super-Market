import 'package:super_market/DataBase/sqlDB.dart';

class CustomerModel {
  SqlDB sqlDB = SqlDB();

  Future addNewCustomer(Map<String, Object?> data) async {
    int res = await sqlDB.post("users", data);

    return res;
  }

  Future getTotal(int id) async {
    List<Map> res = await sqlDB.readData(''' SELECT SUM(amount) FROM 'money'
     WHERE user_id='$id' ''');
    return res;
  }

  Future getAllCustomer() async {
    List<Map> res = await sqlDB.get("users", " type = ? ", ["customer"]);
    return res;
  }

  Future addMoneyToUser(Map<String, Object?> data) async {
    int res = await sqlDB.post("money", data);

    return res;
  }

  Future getMoneyHistoryOfUser(id) async {
    List<Map> res = await sqlDB.get("money", " user_id = ? ", [id]);
    return res;
  }

  Future deleteFromUserHistory(id) async {
    int res = await sqlDB.delete("money", " id = $id ");
    return res;
  }

  Future deleteUser(id) async {
    int res = await sqlDB.delete("users", " id = $id ");
    return res;
  }

  Future search(String search) async {
    List<Map> res = await sqlDB.readData('''SELECT * FROM 'users' WHERE
 name LIKE '%$search%' AND type='customer' ''');
    return res;
  }

  Future editUser(int id, Map<String, Object?> data) async {
    int res = await sqlDB.update("users", data, " id = $id ");
    return res;
  }
}
