import 'package:flutter/material.dart';

import '../../models/products.dart';

class UserProductListTitle extends StatelessWidget {
  final Product product;

  const UserProductListTitle(
    this.product,{
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            EditUserProductButton(),
            DeleteUserProductButton(),
          ],
        )
      ),
    )   ; 
  }

}

class DeleteUserProductButton extends StatelessWidget {
  const DeleteUserProductButton({super.key})
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class EditUserProductButton extends StatelessWidget {
  const EditUserProductButton({super.key})
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}