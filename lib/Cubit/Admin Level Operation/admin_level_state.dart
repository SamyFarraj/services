part of 'admin_level_cubit.dart';

@immutable
abstract class AdminLevelState {}

class AdminLevelInitial extends AdminLevelState {}
class SuccessStatus extends AdminLevelState {}
class FailureStatus extends AdminLevelState {}
class RefreshLevelState extends AdminLevelState {}
class BookReservation extends AdminLevelState {}
class DeleteReservation extends AdminLevelState {}
class AddToDataBase extends AdminLevelState {}

class AlterDataBase extends AdminLevelState {}
