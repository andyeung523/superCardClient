class Insurance {
  final int id;
  String name;
  int price;
  String dueData;
  String des;

  Insurance(this.id, this.name, this.price, this.dueData, this.des);
  Insurance.clone(Insurance o) : this(o.id, o.name, o.price, o.dueData, o.des);
}
