import 'package:super_market/DataBase/sqlDB.dart';

class CustomerModel {
  SqlDB sqlDB = SqlDB();

  Future addNewCustomer(Map<String, Object?> data) async {
    int res = await sqlDB.post("users", data);

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
}
