import 'package:sample_project_warmonks/resources/api_providers/product_api_provider.dart';
import 'package:sample_project_warmonks/resources/api_providers/user_api_provider.dart';

import '../../models/state.dart';

class Repository {
  final userApiProvider = UserApiProvider();
  final productApiProvider = ProductApiProvider();
  Future<State?> login({required username, required password}) =>
      userApiProvider.loginCall(password: password, username: username);

  Future<State?> getCategory() => productApiProvider.getCategory();
  Future<State?> getProduct({required int id}) =>
      productApiProvider.getProduct(id: id);
  Future<State?> getBrand({required int id}) =>
      productApiProvider.getBrand(id: id);
}
