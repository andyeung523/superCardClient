import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:super_card_client/backend_sim/testing_user.dart';
import 'package:super_card_client/backend_sim/insurance_data.dart';

part 'ins_event.dart';
part 'ins_state.dart';

class InsuranceBloc extends Bloc<InsuranceEvent, InsuranceState> {
  InsuranceBloc() : super(InsuranceInitial());
  List<int> subedList = TsetUser.subedInsList;

  @override
  Stream<InsuranceState> mapEventToState(InsuranceEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is ToggleSub) {
        subedList.add(event.iid);
      }
      yield InsuraceLoaded(subedList);
    } catch (error) {
      print(error);
      yield InsuraceError("Load insurace list failed...");
    }
  }
}
