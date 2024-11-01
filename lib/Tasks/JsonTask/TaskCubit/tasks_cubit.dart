import 'package:al_huda_islamic_app/Helpers/Diohelper/Diohelper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../UsersModel/Usersmodel.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  Future<List<UsersModel>> getUsers() async {
    emit(UsersLoadingState());
    try {
      final response = await Diohelper.getData();
      if (response.statusCode == 200) {
        List<UsersModel> users = (response.data as List)
            .map((e) => UsersModel.fromJson(e))
            .toList();
        emit(UsersSuccessState()); // Emit loaded state with the data
        return users;
      } else {
        emit(UsersFailureState("Failed to load users"));
        return [];
      }
    } catch (e) {
      emit(UsersFailureState(e.toString()));
      return [];
    }
  }
}
