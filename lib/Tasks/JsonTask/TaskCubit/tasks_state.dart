part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}
final class UsersLoadingState extends TasksState {}
final class UsersSuccessState extends TasksState {}
final class UsersFailureState extends TasksState {
  final error ;
  UsersFailureState(this.error);
}
