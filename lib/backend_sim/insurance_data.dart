import 'package:super_card_client/data/insurance.dart';

class InsuranceData {
  InsuranceData();

  List<Insurance> list = [
    //id(unique, name, price, due date, description)
    Insurance(0, 'vhis', 90, ' 10/10/2020', 'des'),
    Insurance(1, 'bins', 90, ' 10/10/2020', 'des'),
    Insurance(2, 'cins', 90, ' 10/10/2020', 'des'),
    Insurance(4, 'dins', 90, ' 10/10/2020', 'des'),
    Insurance(5, 'dins', 90, ' 10/10/2020', 'des'),
    Insurance(6, 'dins', 90, ' 10/10/2020', 'des'),
    Insurance(7, 'dins', 90, ' 10/10/2020', 'des'),
    Insurance(8, 'dins', 90, ' 10/10/2020', 'des'),
    Insurance(9, 'dins', 90, ' 10/10/2020', 'des'),
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
