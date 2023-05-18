import 'package:data_table_2/data_table_2.dart';
import 'package:e_commerce_flutter/constants/color.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/admin/view/widgets/edit_button.dart';
import 'package:e_commerce_flutter/features/authentication/logic/view_model/auth_vm.dart';
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
  @override
  void initState() {
    super.initState();
    initProducts();
  }

  void initProducts() async {
    await context.read<ProductPostViewModel>().updateItem();
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
              EditButton(
                buttonType: ButtonType.add,
              ),
            ],
          ),
          AnimatedBuilder(
            animation: context.watch<ProductPostViewModel>(),
            builder: (context, child) => SizedBox(
              width: double.infinity,
              height: 800,
              child: DataTable2(
                columns: const [
                  DataColumn(
                    label: Text(
                      "Id",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Name",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Price",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "수정 & 삭제",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                rows: List.generate(
                  context.read<ProductPostViewModel>().list.length,
                  (index) => productDataRow(context, index,
                      context.read<ProductPostViewModel>().list[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow productDataRow(BuildContext context, int index, Product product) {
  return DataRow(
    onLongPress: () {},
    cells: [
      DataCell(
        Text(
          product.id.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
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
      DataCell(
        Row(
          children: [
            EditButton(
              buttonType: ButtonType.modify,
              index: index,
              product: product,
            ),
            IconButton(
              onPressed: () => onDeleteTap(context, index, product.id!),
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

onDeleteTap(BuildContext context, int index, int id) {
  var token = context.read<AuthenticartionViewModel>().updateToken;
  context.read<ProductPostViewModel>().deleteItem(
        index: index,
        id: id,
        token: token,
      );
}
