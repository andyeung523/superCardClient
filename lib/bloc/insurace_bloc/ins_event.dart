part of 'ins_bloc.dart';

@immutable
abstract class InsuranceEvent {}

class ToggleSub extends InsuranceEvent {
  final int iid;

  ToggleSub(this.iid);
}

class RefreashInsurace extends InsuranceEvent {
  RefreashInsurace();
}
