import 'package:flutter/material.dart';
import 'detail.dart';
import 'models/food_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu Resto',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        itemCount: FoodItem.sampleData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
            },
            child: ListTile(
              title: Text(FoodItem.sampleData[index].name),
              subtitle: Text('Rp ${FoodItem.sampleData[index].price}'),
              // leading: Image.network(
              //   FoodItem.sampleData[index].image,
              //   width: 50,
              //   height: 50,
              // ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
            ),
          );
        },
      ),
    );
  }
}
