import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/admin/screens/addproduct.dart';
import 'package:amazon/features/admin/services/admin_services.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/widgets/prouductview.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class admin_screen extends StatefulWidget {
  const admin_screen({super.key});

  @override
  State<admin_screen> createState() => _admin_screenState();
}

class _admin_screenState extends State<admin_screen> {
  bool _isloading = true;
  List<Product>? products;
  final admin_services adminservice = admin_services();

  void getproduct() async {
    products = await adminservice.getproducts(context);
    setState(() {
      _isloading = false;
    });
  }

  void delete_product(BuildContext context, Product product) {
    adminservice.deleteproduct(context, product, () {
      setState(() {});
    });
  }

  @override
  void initState() {
    getproduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/amazon_in.png",
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
                const Text(
                  "Admin",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: _isloading
          ? Center(
              child: LoadingAnimationWidget.inkDrop(
                color: global_variables.selectedNavBarColor,
                size: 40,
              ),
            )
          : products == null
              ? const Center(
                  child: Text(
                    "There is not any Products in your list!",
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: products!.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 145,
                            child: prouductview(
                              link: products![index].images[0],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    products![index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    delete_product(
                                        context, products![index]);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const addproduct()));
        },
        tooltip: "Add a Product",
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
