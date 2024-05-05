import 'package:sample_project_warmonks/models/get_user_response_model.dart';
import 'package:sample_project_warmonks/utils/api_client.dart';
import 'package:sample_project_warmonks/utils/utils.dart';

import '../../models/state.dart';

class UserApiProvider {
  final apiClient = ApiClient();

  Future<State?> loginCall({required username, required password}) async {
    try {
      GetUserResponseModel getUserResponseModel = GetUserResponseModel();
      dynamic response =
          await apiClient.loginRequest(username: username, password: password);

      if (response.statusCode == 200) {
        getUserResponseModel = GetUserResponseModel.fromJson(response.data);
        return State.success(getUserResponseModel);
      } else {
        return State.error("Login failed");
      }
    } catch (e) {
      showToast("wrong username or password");
      print('Error occurred during login call: $e');

      return State.error("Login failed");
    }
  }
}
