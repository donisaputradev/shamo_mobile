import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.fetchUserUseCase}) : super(UserState.initial()) {
    on<GetUserDetailEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: UserStateStatus.loading));
        final usecase = await fetchUserUseCase(const NoParams());
        usecase.fold(
          (l) {
            emit(state.copyWith(status: UserStateStatus.failure, failure: l));
          },
          (r) {
            emit(state.copyWith(status: UserStateStatus.success, user: r));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });
  }

  final FetchUserUseCase fetchUserUseCase;
}
