import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:super_market/Model/totalModel.dart';

class TotalController extends GetxController {
  TotalModel model = TotalModel();

  List outlyReport = [].obs;
  List totalOfMonthReport = [].obs;
  List totalOfDayReport = [].obs;
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  Future getTotal() async {
    List<Map> res = await model.getTotal();
    outlyReport.clear();
    outlyReport.addAll(res);
    update();
  }

  getTotalOfMonth(String date) async {
    List<Map> res = await model.getOutlaysOfMonth(date);
    totalOfMonthReport.clear();
    totalOfMonthReport.addAll(res);
  }

  getTotalOfDay(String date) async {
    List<Map> res = await model.getOutlaysOfdAY(date);
    totalOfDayReport.clear();
    totalOfDayReport.addAll(res);
  }
}
