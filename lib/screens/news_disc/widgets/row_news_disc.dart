import 'package:flutter/material.dart';

/**
 * Created by Vinicius Budel on 29,Janeiro,2021
 */
class RowNewsDisc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return               Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.favorite_border),
          Text(
            "24/03/2020 09h24 | Atualizada em 24/03/2020 14h54",
            style:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
