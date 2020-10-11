part of 'ins_bloc.dart';

@immutable
abstract class InsuranceEvent {}

class ToggleSub extends InsuranceEvent {
  final int iid;

  ToggleSub(this.iid);
}

class InsuraceLoaded extends InsuranceEvent {}

class InsuraceError extends InsuranceEvent {}
