import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recharge_form_state.dart';

class RechargeFormCubit extends Cubit<List> {
  RechargeFormCubit() : super([]);

  addForm(List<String> form) {
    state.add(form);
    print("bloc cubit added $state");
    emit([...state]);
  }
}
