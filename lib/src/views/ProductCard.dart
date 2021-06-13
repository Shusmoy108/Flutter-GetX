import 'package:flutter/material.dart';
import 'package:securemart/environments/commonenv.dart';
import 'package:securemart/models/item.dart';

class ItemCart extends StatelessWidget {
  final Item item;
  final Function(Item i) getItemdetail;
  const ItemCart(this.item, this.getItemdetail);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print(item.itemName);
          this.getItemdetail(item);
        },
        child: Container(
          width: 200,
          //height: 200,
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.network(
                          SERVER_URL + item.thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    item.itemName,
                    maxLines: 2,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('৳${item.averagePrice}',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        IconButton(
                          onPressed: () {
                            //print("object");
                          },
                          icon: Icon(Icons.shopping_cart),
                          color: Colors.orange.shade900,
                        )
                      ]),
                ],
              ),
            ),
          ),
        ));
  }
}
