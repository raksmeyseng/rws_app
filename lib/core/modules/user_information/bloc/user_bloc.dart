import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';
import 'package:rws_app/core/modules/authentication/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required this.authRepo,
    required this.userRepo,
  }) : super(const UserState()) {
    on<UserEvent>(_onEvent);
  }

  final AuthRepository authRepo;
  final UserRepository userRepo;

  Future<void> _onEvent(UserEvent event, Emitter<UserState> emit) async {

  }
}
