import 'package:data_table_2/data_table_2.dart';
import 'package:e_commerce_flutter/constants/color.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/admin/view/widgets/add_button.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/product_post_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(imgPath: "imgPath", name: "name", price: 500)
  ];

  @override
  void initState() {
    super.initState();
    initProducts();
  }

  void initProducts() async {
    products = await context.read<ProductPostViewModel>().updateItem();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.size40),
      decoration: const BoxDecoration(
        color: AdminColor.secondary,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Product List",
                style: TextStyle(
                  fontSize: Sizes.size18,
                  color: Colors.white,
                ),
              ),
              AddButton(),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 800,
            child: DataTable2(
              columns: const [
                DataColumn(
                  label: Text(
                    "Product Name",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Price",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              rows: List.generate(
                products.length,
                (index) => recentFileDataRow(products[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(Product product) {
  return DataRow(
    onLongPress: () {},
    cells: [
      DataCell(
        Text(
          product.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      DataCell(
        Text(
          product.price.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
