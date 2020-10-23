class Insurance {
  final int id;
  String name;
  int price;
  String dueDate;
  String status;
  String des;

  Insurance(this.id, this.name, this.price, this.status, this.dueDate, this.des);
  Insurance.clone(Insurance o) : this(o.id, o.name, o.price,o.status, o.dueDate, o.des);
}
