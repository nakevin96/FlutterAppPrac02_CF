import 'package:prac01ui/common/const/data.dart';

class DataUtils {
  // jsonKey annoation에 넣어줄 함수는 무조건 static이어야 합니다.
  static pathToUrl(String value) {
    return 'http://$ip$value';
  }
}
