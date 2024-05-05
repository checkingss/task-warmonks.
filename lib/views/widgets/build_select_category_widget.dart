import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_project_warmonks/Utils/constants.dart';
import 'package:sample_project_warmonks/block/product_bloc.dart';
import 'package:sample_project_warmonks/utils/utils.dart';

import 'build_drop_down_widget.dart';

class BuildSelectCategoryWidget extends StatefulWidget {
  final List<String> categoryList;
  // final List<String> brandList;
  const BuildSelectCategoryWidget({
    super.key,
    required this.categoryList,
    // required this.brandList,
  });

  @override
  State<BuildSelectCategoryWidget> createState() =>
      _BuildSelectCategoryWidgetState();
}

class _BuildSelectCategoryWidgetState extends State<BuildSelectCategoryWidget> {
  int selectedIndex = -1;
  ProductBloc productBloc = ProductBloc();
  List<String> productList = [];
  List<String> productId = [];
  List<String> brandlist = [];
  List<String> brandId = [];
  String categorySelectedValue = "Select Category";
  String productSelectedValue = "Select Product";
  String brandSelectValue = "Select Brand";

  getProduct({required int id}) {
    productBloc.getProduct(id: id);
  }

  getBrand({required int id}) {
    productBloc.getBrand(id: id);
  }

  @override
  void initState() {
    productBloc.getProductStream.listen((event) {
      productList.clear();
      productId.clear();
      for (var item in event.data!) {
        setState(() {
          productList.add(item.name!);
          productId.add(item.id!);
        });
      }
    });
    productBloc.getBrandStream.listen((event) {
      brandlist.clear();
      brandId.clear();
      for (var brandItems in event.data!) {
        setState(() {
          brandlist.add(brandItems.brand!);
          brandId.add(brandItems.id!);
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: screenWidth(context, dividedBy: 15)),
      child: Container(
        height: screenHeight(context, dividedBy: 4),
        width: screenWidth(context),
        decoration: BoxDecoration(
            color: Constants.kitGradients[0],
            border: Border.all(color: Constants.kitGradients[1]),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
              const Spacer(),
              BuildDropDownButtonFormFieldWidget(
                list: widget.categoryList,
                ontap: (selectedValue) {
                  print(selectedValue);
                  print(widget.categoryList.indexOf(selectedValue));
                  categorySelectedValue = selectedValue;
                  selectedIndex =
                      widget.categoryList.indexOf(selectedValue) + 1;
                  print(selectedIndex);
                  getProduct(id: selectedIndex);
                },
                value: categorySelectedValue,
                hindtext: categorySelectedValue,
              ),
              const Spacer(),
              BuildDropDownButtonFormFieldWidget(
                list: productList,
                ontap: (seletedValue) {
                  print(productList.indexOf(productSelectedValue));
                  productSelectedValue = seletedValue;
                  selectedIndex = productList.indexOf(productSelectedValue) + 1;
                  print('llllllllllllllllllllllllllllllll');
                  print(selectedIndex);
                  getBrand(id: selectedIndex);
                },
                value: productSelectedValue,
                hindtext: productSelectedValue,
              ),
              const Spacer(),
              BuildDropDownButtonFormFieldWidget(
                list: brandlist,
                ontap: (seletedValue) {
                  print(brandlist.indexOf(brandSelectValue));
                  brandSelectValue = seletedValue;
                  selectedIndex = brandlist.indexOf(brandSelectValue) + 1;
                  print(selectedIndex);
                  // getBrand(id: selectedIndex);
                },
                value: brandSelectValue,
                hindtext: brandSelectValue,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
