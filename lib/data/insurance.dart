class Insurance {
  String name;
  int price;
  bool isSubed;
  Insurance(this.name, this.price, this.isSubed);

  List<Object> get props => [name, price, isSubed];
}
