import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/search/services/searchservices.dart';
import 'package:amazon/features/search/widgets/search_product_view.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/widgets/addressbar.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class searchscreen extends StatefulWidget {
  final String query;
  const searchscreen({super.key, required this.query});

  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  List<Product>? products;
  bool _isloading = true;
  final search_services searchservice = search_services();

  getproduct() async {
    products = await searchservice.getproduct(widget.query, context);
    setState(() {
      _isloading = false;
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
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: global_variables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => searchscreen(query: value),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search Amazon.in',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ],
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
          : Column(
              children: [
                const addressbar(),
                products!.isEmpty
                    ? Text(
                        "No Product name found as ${widget.query}",
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          return searchproductview(
                            product: products![index],
                            query: widget.query,
                          );
                        },
                      ),
              ],
            ),
    );
  }
}
