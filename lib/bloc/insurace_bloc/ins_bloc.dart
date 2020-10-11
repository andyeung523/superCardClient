import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:super_card_client/backend_sim/testing_user.dart';
import 'package:super_card_client/backend_sim/insurance_data.dart';
import 'package:super_card_client/data/insurance.dart';

part 'ins_event.dart';
part 'ins_state.dart';

class InsuranceBloc extends Bloc<InsuranceEvent, InsuranceState> {
  InsuranceBloc() : super(InsuranceInitial());
  List<int> subedList = TsetUser.subedInsList;
  InsuranceData insData = InsuranceData();
  Future<List<List<Insurance>>> getData() async {
    return Future.delayed(
        Duration(seconds: 1),
        () => Future<List<List<Insurance>>>(() {
              return insData.subOrNotList(subedList);
            }));
  }

  @override
  Stream<InsuranceState> mapEventToState(InsuranceEvent event) async* {
    try {
      if (event is ToggleSub) {
        subedList.add(event.iid);
      } else if (event is RefreashInsurace) {
        yield InsuranceLoading();
      }
      var list = await getData();
      yield InsuraceLoaded(list);
    } catch (error) {
      print(error);
      yield InsuraceError("Load insurace list failed...");
    }
  }
}
