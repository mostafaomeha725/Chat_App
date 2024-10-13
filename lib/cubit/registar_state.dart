part of 'registar_cubit.dart';

@immutable
sealed class RegistarState {}

final class RegistarInitial extends RegistarState {}

final class RegistarLoading extends RegistarState {}

final class RegistarSuccess extends RegistarState {}

final class RegistarFailure extends RegistarState {
  final String errMessage;

  RegistarFailure(this.errMessage);
}
