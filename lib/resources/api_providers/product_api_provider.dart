import 'dart:convert';

import 'package:sample_project_warmonks/models/brand_response_model.dart';
import 'package:sample_project_warmonks/models/category_response_model.dart';
import 'package:sample_project_warmonks/models/product_response_model.dart';

import '../../models/state.dart';
import '../../utils/api_client.dart';
import '../../utils/utils.dart';

class ProductApiProvider {
  final apiClient = ApiClient();

  Future<State?> getCategory() async {
    try {
      CategoryResponseModel categoryResponseModel = CategoryResponseModel();
      dynamic response = await apiClient.getCategory();

      if (response.statusCode == 200) {
        categoryResponseModel = CategoryResponseModel.fromJson(response.data);
        return State.success(categoryResponseModel);
      } else {
        return State.error("Error Loading category");
      }
    } catch (e) {
      showToast("Error Loading category");
      print('Error Loading category: $e');

      return State.error("Error Loading category");
    }
  }

  Future<State?> getProduct({required int id}) async {
    try {
      ProductResponseModel productResponseModel = ProductResponseModel();
      dynamic response = await apiClient.getProduct(id: id);

      if (response != null && response.data != null) {
        print("hi");
        print(response.data);
        productResponseModel = ProductResponseModel.fromJson(response.data);
        print(productResponseModel);
        print(response.data);
        return State.success(productResponseModel);
      } else {
        return State.error("Error Loading product");
      }
    } catch (e) {
      showToast("Error Loading product");
      print('Error Loading product: $e');
      return State.error("Error Loading product");
    }
  }

  Future<State?> getBrand({required int id}) async {
    try {
      BrandResponseModel brandResponseModel = BrandResponseModel();
      dynamic response = await apiClient.getBrand(id: id);

      if (response != null && response.data != null) {
        print("hoooi");
        print(response.data);
        brandResponseModel = BrandResponseModel.fromJson(response.data);
        print(brandResponseModel);
        print(response.data);
        return State.success(brandResponseModel);
      } else {
        return State.error("Error Loading product");
      }
    } catch (e) {
      showToast("Error Loading product");
      print('Error Loading product: $e');
      return State.error("Error Loading product");
    }
  }
}
