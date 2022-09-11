part of 'user_operation_cubit.dart';

@immutable
abstract class UserOperationState {}

class UserOperationInitial extends UserOperationState {}


class SuccessStatus extends UserOperationState {}
class FailureStatus extends UserOperationState {}
class RefreshLevelState extends UserOperationState {}
class BookReservation extends UserOperationState {}
class DeleteReservation extends UserOperationState {}

