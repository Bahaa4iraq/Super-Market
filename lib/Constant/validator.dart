const String messageEmpty = "لا يمكن ان يكون الحقل فارغ";
const String messageMax = "لا يمكن ان يكون الحقل اكبر من";

const String messageMin = "لا يمكن ان يكون الحقل اصغر من";

validatorText(String val, int max, int min) {
  if (val.isEmpty) {
    return messageEmpty;
  }
  if (val.length > max) {
    return "$messageMax $max";
  }

  if (val.length < min) {
    return "$messageMin $min";
  }
}
