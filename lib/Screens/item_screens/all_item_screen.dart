import 'package:flutter/cupertino.dart';

import '../../custom_widgets/product_container.dart';

class AllItemScreen extends StatelessWidget {
  const AllItemScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
            mainAxisExtent: 310,
          ),
          itemCount: 20, // Total 20 items
          itemBuilder: (BuildContext context, int index) {
            return ProductContainer();
          },
        ),
      ),
    );
  }
}