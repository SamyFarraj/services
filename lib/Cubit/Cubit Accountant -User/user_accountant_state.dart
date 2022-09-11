part of 'user_accountant_cubit.dart';

@immutable
abstract class UserAccountantState {}

class UserAccountantInitial extends UserAccountantState {}
class RefreshLevelState extends UserAccountantState {}
class getcode extends UserAccountantState {}

class Seccfullog extends UserAccountantState {}

class seccfulcodePass extends UserAccountantState {}

class SeccfullEditPass extends UserAccountantState {}

class Editpassload extends UserAccountantState {}

class CheckPassword extends UserAccountantState {}

class ErrorPasswordState extends UserAccountantState {}

class SuccessSignUpState extends UserAccountantState {}

class FailedSignUpState extends UserAccountantState {}
class CheckInformation extends UserAccountantState {}

class EditAccountInfo extends UserAccountantState {}
class SuccessStatus extends UserAccountantState {}
class FailureStatus extends UserAccountantState {}