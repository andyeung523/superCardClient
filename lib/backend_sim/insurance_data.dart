import 'package:super_card_client/data/insurance.dart';

class InsuranceData {
  InsuranceData();

  List<Insurance> list = [
    Insurance(0, 'vhis', 90, ' dueData', 'des'),
    Insurance(1, 'bins', 90, ' dueData', 'des'),
    Insurance(2, 'cins', 90, ' dueData', 'des'),
    Insurance(3, 'dins', 90, ' dueData', 'des'),
  ];

  List<List<Insurance>> subOrNotList(List<int> subedList) {
    List<Insurance> tmpSubedList = [];
    List<Insurance> tmpNotSubedList = [];

    for (int i = 0; i < list.length; ++i) {
      if (subedList.contains(i)) {
        tmpSubedList.add(list[i]);
      } else {
        tmpNotSubedList.add(list[i]);
      }
    }
    return [tmpSubedList, tmpNotSubedList];
  }
}
