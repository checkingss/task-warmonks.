import 'package:flutter/material.dart';
import 'package:sample_project_warmonks/Utils/constants.dart';
import 'package:sample_project_warmonks/block/product_bloc.dart';
import 'package:sample_project_warmonks/models/category_response_model.dart';
import 'package:sample_project_warmonks/utils/utils.dart';
import 'package:sample_project_warmonks/views/saved_view.dart';
import 'package:sample_project_warmonks/views/widgets/build_common_button_with_text_icon_widget.dart';
import 'package:sample_project_warmonks/views/widgets/build_custom_clip_path_widget.dart';
import 'package:sample_project_warmonks/views/widgets/build_drop_down_widget.dart';
import 'package:sample_project_warmonks/views/widgets/build_icon_widget.dart';
import 'package:sample_project_warmonks/views/widgets/build_select_category_widget.dart';
import 'package:sample_project_warmonks/views/widgets/build_text_form_field_widget.dart';
import 'package:sample_project_warmonks/views/widgets/build_text_widget.dart';

class EnquiryFormPage extends StatefulWidget {
  const EnquiryFormPage({super.key});

  @override
  State<EnquiryFormPage> createState() => _EnquiryFormPageState();
}

class _EnquiryFormPageState extends State<EnquiryFormPage> {
  final occuptionController = TextEditingController();
  final sourceOfEnquiryController = TextEditingController();
  final coOfEnquiryController = TextEditingController();
  final customerBudgetController = TextEditingController();
  final nameController = TextEditingController();
  final placeController = TextEditingController();
  final contactNumberController = TextEditingController();
  final referenceNumberController = TextEditingController();
  final businessTypeController = TextEditingController();
  final branchController = TextEditingController();
  final formNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int selectCategoryCount = 0;
  ProductBloc productBloc = ProductBloc();
  List<String> categoryList = [];
  // List<String> brandList = ['Ac', 'Tv', 'Fridge'];
  // List<String> productList = ['452', '896', '214'];
  bool isLoading = false;
  CategoryResponseModel categoryResponseModel = CategoryResponseModel();

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    print(('kkkkkkkkkkkkkkkkkkk'));
    productBloc.getBrand(id: 47);
    print('hhhhhhhhhhhhhhhhhhhhh');
    productBloc.getCategory();
    productBloc.getCategoryStream.listen((event) {
      categoryResponseModel = event;
      print("event.data!.length");
      for (var item in event.data!) {
        categoryList.add(item.catgName!);
      }
      print(event.data!.length);
      print(categoryResponseModel.data!.length);
      setState(() {
        isLoading = false;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.kitGradients[0],
            title: Column(
              children: [
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth(context, dividedBy: 2.3)),
                  child: const BuildTextWidget(
                      text: 'Enquiry Form',
                      size: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    screenWidth(context, dividedBy: 15)),
                            child: Column(
                              children: [
                                BuildTexFormFieldWidget(
                                    validation: (value) => validateField(value),
                                    controller: branchController,
                                    hintText: 'Select Branch'),
                                const SizedBox(
                                  height: 10,
                                ),
                                BuildTexFormFieldWidget(
                                    validation: (value) => validateField(value),
                                    controller: formNumberController,
                                    hintText: 'Formnumber'),
                                const SizedBox(
                                  height: 10,
                                ),
                                BuildTexFormFieldWidget(
                                    validation: (value) => validateField(value),
                                    controller: nameController,
                                    hintText: 'Name'),
                                const SizedBox(
                                  height: 10,
                                ),
                                BuildTexFormFieldWidget(
                                    validation: (value) => validateField(value),
                                    controller: placeController,
                                    hintText: 'Place'),
                                const SizedBox(
                                  height: 10,
                                ),
                                BuildTexFormFieldWidget(
                                    keyBoardType: TextInputType.phone,
                                    validation: (value) => validateField(value),
                                    controller: contactNumberController,
                                    hintText: 'ContactNumber'),
                                const SizedBox(
                                  height: 10,
                                ),
                                BuildTexFormFieldWidget(
                                    validation: (value) => validateField(value),
                                    controller: referenceNumberController,
                                    hintText: 'Reference Number'),
                                const SizedBox(
                                  height: 10,
                                ),
                                BuildTexFormFieldWidget(
                                    validation: (value) => validateField(value),
                                    controller: referenceNumberController,
                                    hintText: 'Buisness Type : Retail'),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: selectCategoryCount,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BuildSelectCategoryWidget(
                              categoryList: categoryList,
                              // brandList: brandList,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: screenWidth(context, dividedBy: 2.8),
                            ),
                            BuildCommonButtonWithTextIconWidget(
                              onPressed: () {
                                setState(() {
                                  selectCategoryCount++;
                                });
                              },
                              width: screenWidth(context, dividedBy: 4.6),
                              icon: Icons.add,
                              text: 'Add',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            BuildCommonButtonWithTextIconWidget(
                                onPressed: () {
                                  setState(() {
                                    selectCategoryCount--;
                                  });
                                },
                                width: screenWidth(context, dividedBy: 3.1),
                                text: 'Remove',
                                icon: Icons.delete_outline,
                                iconColor: Constants.kitGradients[2]),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context, dividedBy: 15)),
                          child: Column(
                            children: [
                              BuildTexFormFieldWidget(
                                  validation: (value) => validateField(value),
                                  controller: occuptionController,
                                  hintText: 'Occupation'),
                              const SizedBox(
                                height: 25,
                              ),
                              BuildTexFormFieldWidget(
                                  validation: (value) => validateField(value),
                                  controller: sourceOfEnquiryController,
                                  hintText: 'Source of Enquiry'),
                              const SizedBox(
                                height: 8,
                              ),
                              BuildTexFormFieldWidget(
                                  validation: (value) => validateField(value),
                                  controller: coOfEnquiryController,
                                  hintText: 'C/O of enquiry'),
                              const SizedBox(
                                height: 25,
                              ),
                              BuildTexFormFieldWidget(
                                  validation: (value) => validateField(value),
                                  controller: customerBudgetController,
                                  hintText: 'Customer budget'),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar: Container(
            height: screenHeight(context, dividedBy: 15.0),
            width: screenWidth(context),
            color: Constants.kitGradients[2],
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Savedview(),
                          ));
                    }
                  },
                  child: BuildTextWidget(
                    text: 'Save and Proceed',
                    color: Constants.kitGradients[0],
                    fontWeight: FontWeight.w600,
                    size: 12,
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                Container(
                  height: screenHeight(context),
                  width: screenWidth(context, dividedBy: 5.1),
                  color: Constants.kitGradients[3].withOpacity(0.5),
                  child: Center(
                    child: BuildIconWidget(
                        icon: Icons.person, color: Constants.kitGradients[0]),
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                BuildIconWidget(
                    icon: Icons.settings, color: Constants.kitGradients[0]),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: screenHeight(context),
                    width: screenWidth(context, dividedBy: 5.1),
                    color: Constants.kitGradients[3].withOpacity(0.5),
                    child: Center(
                      child: BuildIconWidget(
                        icon: Icons.arrow_back_ios_new,
                        size: 17,
                        color: Constants.kitGradients[0],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          // left: screenWidth(context, dividedBy: 18),
          top: screenHeight(context, dividedBy: 18),
          child: RotationTransition(
            turns: new AlwaysStoppedAnimation(50 / 100),
            child: SizedBox(
              height: screenHeight(context, dividedBy: 9.5),
              width: screenWidth(context, dividedBy: 4.1),
              child: ClipPath(
                  clipper: ClipTriangle(),
                  child: Container(
                    color: Constants.kitGradients[2],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
