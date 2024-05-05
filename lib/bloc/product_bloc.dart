import 'dart:async';

import 'package:sample_project_warmonks/models/brand_response_model.dart';
import 'package:sample_project_warmonks/models/category_response_model.dart';
import 'package:sample_project_warmonks/models/product_response_model.dart';

import '../models/state.dart';
import '../resources/repository/repository.dart';
import 'base_bloc.dart';

class ProductBloc extends BaseBloc {
  Repository get repository => Repository();
  final StreamController<bool> _loading = StreamController<bool>.broadcast();
  final StreamController<CategoryResponseModel> _getCategory =
      StreamController<CategoryResponseModel>.broadcast();

  final StreamController<ProductResponseModel> _getProduct =
      StreamController<ProductResponseModel>.broadcast();

  final StreamController<BrandResponseModel> _getBrand =
      StreamController<BrandResponseModel>.broadcast();

  Stream<CategoryResponseModel> get getCategoryStream => _getCategory.stream;
  Stream<ProductResponseModel> get getProductStream => _getProduct.stream;
  Stream<BrandResponseModel> get getBrandStream => _getBrand.stream;
  Stream<bool> get loadingListener => _loading.stream;

  StreamSink<CategoryResponseModel> get getCategorySink => _getCategory.sink;
  StreamSink<ProductResponseModel> get getProductSink => _getProduct.sink;
  StreamSink<BrandResponseModel> get getBrandSink => _getBrand.sink;
  StreamSink<bool> get loadingSink => _loading.sink;

  getCategory() async {
    loadingSink.add(true);
    State? state = await repository.getCategory();
    if (state is SuccessState) {
      loadingSink.add(false);
      getCategorySink.add(state.value);
    } else if (state is ErrorState) {
      loadingSink.add(false);
      getCategorySink.addError("Some error occurred.");
    }
  }

  getProduct({required int id}) async {
    loadingSink.add(true);
    State? state = await repository.getProduct(id: id);
    if (state is SuccessState) {
      loadingSink.add(false);
      getProductSink.add(state.value);
    } else if (state is ErrorState) {
      loadingSink.add(false);
      getProductSink.addError("Some error occurred.");
    }
  }

  getBrand({required int id}) async {
    loadingSink.add(true);
    State? state = await repository.getBrand(id: id);
    if (state is SuccessState) {
      loadingSink.add(false);
      getBrandSink.add(state.value);
      ;
    } else if (state is ErrorState) {
      loadingSink.add(false);
      getBrandSink.addError("Some error occurred");
    }
    ;
  }

  @override
  void dispose() {
    _getBrand.close();
    _getProduct.close();
    _getCategory.close();
    // TODO: implement dispose
  }
}
