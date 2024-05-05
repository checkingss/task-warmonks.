import 'dart:async';

import '../Utils/constants.dart';
import '../models/get_user_response_model.dart';
import '../models/state.dart';
import '../resources/repository/repository.dart';
import 'base_bloc.dart';

class UserBloc extends Object implements BaseBloc {
  Repository get repository => Repository();
  final StreamController<bool> _loading = StreamController<bool>.broadcast();

  final StreamController<GetUserResponseModel> _login =
      StreamController<GetUserResponseModel>.broadcast();

  // ignore: close_sinks

  // stream controller is broadcasting the  details

  /// stream for progress bar
  Stream<bool> get loadingListener => _loading.stream;
  Stream<GetUserResponseModel> get loginListerner => _login.stream;

  ///sink
  StreamSink<bool> get loadingSink => _loading.sink;
  StreamSink<GetUserResponseModel> get loginSink => _login.sink;

  login({required String username, required String password}) async {
    loadingSink.add(true);
    State? state =
        await repository.login(username: username, password: password);
    if (state is SuccessState) {
      loadingSink.add(false);
      loginSink.add(state.value);
    } else if (state is ErrorState) {
      loadingSink.add(false);
      loginSink.addError("Some error occurred.");
    }
  }

  ///disposing the stream if it is not using
  @override
  void dispose() {
    _loading.close();
    _login.close();
  }
}
