import 'dart:io';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/admin/services/admin_services.dart';
import 'package:amazon/features/admin/widgets/sliderimages.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/widgets/button.dart';
import 'package:amazon/widgets/textformfield.dart';
import 'package:amazon/widgets/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class addproduct extends StatefulWidget {
  const addproduct({super.key});

  @override
  State<addproduct> createState() => _addproductState();
}

class _addproductState extends State<addproduct> {
  final TextEditingController _productnamecontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();
  final TextEditingController _pricecontroller = TextEditingController();
  final TextEditingController _quantitycontroller = TextEditingController();
  final admin_services adminservice = admin_services();
  final _addproductkey = GlobalKey<FormState>();
  bool _addproduct = false;
  String category = "Mobiles";
  List<File> images = [];
  List<String> items = [
    "Mobiles",
    "Essentials",
    "Appliances",
    "Books",
    "Fashion",
  ];

  void addimages() async {
    var res = await pickimages();
    setState(() {
      images = res;
    });
  }

  void addproduct(user) async {
    if (_addproductkey.currentState!.validate() && images.isNotEmpty) {
      _addproduct = await adminservice.addproduct(
        context,
        _productnamecontroller.text,
        _descriptioncontroller.text,
        category,
        double.parse(_pricecontroller.text),
        double.parse(_quantitycontroller.text),
        images,
      );
      setState(() {});
    }
  }

  @override
  void dispose() {
    _productnamecontroller.dispose();
    _descriptioncontroller.dispose();
    _pricecontroller.dispose();
    _quantitycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<user_provider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: global_variables.appBarGradient,
            ),
          ),
          title: const Text(
            "Add Product",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _addproductkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                images.isNotEmpty
                    ? sliderimages_admin(
                        images: images,
                      )
                    : GestureDetector(
                        onTap: (() {
                          addimages();
                        }),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          strokeCap: StrokeCap.round,
                          dashPattern: const [10, 4],
                          child: SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.folder_open,
                                  size: 35,
                                ),
                                Text(
                                  "Select Product Images",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                textformfield(
                  controller: _productnamecontroller,
                  hinttext: "Product Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                textformfield(
                  controller: _descriptioncontroller,
                  hinttext: "Decscription",
                  maxline: 6,
                ),
                const SizedBox(
                  height: 10,
                ),
                textformfield(
                  controller: _pricecontroller,
                  hinttext: "Price",
                  keybordtype: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                textformfield(
                  controller: _quantitycontroller,
                  hinttext: "Quantity",
                  keybordtype: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton(
                    onChanged: (val) {
                      setState(() {
                        category = val!;
                      });
                    },
                    value: category,
                    items: items.map((String e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                  ),
                ),
                _addproduct
                    ? LoadingAnimationWidget.threeRotatingDots(
                        color: global_variables.secondaryColor,
                        size: 50,
                      )
                    : button(
                        ontap: () {
                          setState(() {
                            _addproduct = true;
                            addproduct(user);
                          });
                        },
                        text: "Sell",
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
