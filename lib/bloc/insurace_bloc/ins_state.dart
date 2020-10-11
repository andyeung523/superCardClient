part of 'ins_bloc.dart';

@immutable
abstract class InsuranceState {
  const InsuranceState();
}

class InsuranceInitial extends InsuranceState {
  const InsuranceInitial();
}

class InsuranceLoading extends InsuranceState {
  const InsuranceLoading();
}

class InsuraceLoaded extends InsuranceState {
  final List<List<Insurance>> list;
  const InsuraceLoaded(this.list);

  @override
  bool operator ==(Object o) {
    /// FIXME: always false to ensure rebuild UI
    /// imporve the algorithm for better performance

    if (identical(this, o)) return true;
    return o is InsuraceLoaded && listEquals(o.list, list);
  }

  @override
  int get hashCode => list.hashCode;
}

class InsuraceError extends InsuranceState {
  final String message;

  const InsuraceError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is InsuraceError && o.message == message;
  }
}
