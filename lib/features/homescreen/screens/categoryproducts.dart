import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/homescreen/services/userservices.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/widgets/prouductview.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class categoryproducts extends StatefulWidget {
  final String category;

  const categoryproducts({super.key, required this.category});

  @override
  State<categoryproducts> createState() => _categoryproductsState();
}

class _categoryproductsState extends State<categoryproducts> {
  bool _isloading = true;
  List<Product>? products;
  final user_services userservice = user_services();

  void getproducts() async {
    products = await userservice.getproduct(widget.category, context);
    setState(() {
      _isloading = false;
    });
  }

  @override
  void initState() {
    getproducts();
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
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
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
          : products!.isEmpty
              ? Center(
                  child: Text(
                    "No Product in ${widget.category}",
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: products!.length,
                  itemBuilder: (context, index) {
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
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
    );
  }
}
