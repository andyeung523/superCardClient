class InsuranceData {
  String name;
  int price;
  String dueData;
  String des;
  bool isSubed;
  InsuranceData(this.name, this.price, this.dueData, this.des, this.isSubed);

  List<Object> get props => [name, price, dueData, des, isSubed];
}
