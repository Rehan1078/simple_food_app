import 'package:flutter/material.dart';
import 'CartScreen.dart';
import 'main.dart';

class FoodListScreen extends StatefulWidget {
  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  List<FoodItem> foodItems = [
    FoodItem(
        title: 'Burger',
        subtitle: 'Cheese, Chicken, and Veggies',
        imageUrl: 'assets/burger.jpeg'),
    FoodItem(
        title: 'Pizza',
        subtitle: 'Mozzarella, Tomato, Basil',
        imageUrl: 'assets/pizza.jpeg'),
    FoodItem(
        title: 'Pasta',
        subtitle: 'Creamy Alfredo with Chicken',
        imageUrl: 'assets/pasta.jpeg'),
    FoodItem(
        title: 'Tacos',
        subtitle: 'Beef, Cheese, and Salsa',
        imageUrl: 'assets/tacos.jpeg'),
    FoodItem(
        title: 'Sushi',
        subtitle: 'Salmon, Rice, and Seaweed',
        imageUrl: 'assets/Sushi.jpeg'),
    FoodItem(
        title: 'Salad',
        subtitle: 'Lettuce, Cucumber, and Tomatoes',
        imageUrl: 'assets/Salad.jpeg'),
    FoodItem(
        title: 'Steak',
        subtitle: 'Grilled Beef with Garlic Butter',
        imageUrl: 'assets/Steak.jpeg'),
    FoodItem(
        title: 'Fried Chicken',
        subtitle: 'Crispy and Spicy Chicken Legs',
        imageUrl: 'assets/fried_chicken.jpeg'),
    FoodItem(
        title: 'Hot Dog',
        subtitle: 'Sausage, Mustard, and Ketchup',
        imageUrl: 'assets/hotdog.jpeg'),
    FoodItem(
        title: 'Ice Cream',
        subtitle: 'Vanilla with Chocolate Chips',
        imageUrl: 'assets/ice_cream.jpeg'),
  ];


  List<FoodItem> cartItems = [];

  void addToCart(FoodItem item) {
    setState(() {
      item.isInCart = true;
      cartItems.add(item);
    });
  }

  void removeFromCart(FoodItem item) {
    setState(() {
      item.isInCart = false;
      cartItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (cartItems.isNotEmpty)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        cartItems.length.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cartItems: cartItems,
                    removeFromCart: removeFromCart,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          return Card(
            elevation: 8,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image of the food item
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  // Title and subtitle in a column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          item.subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Add to favorite button
                  IconButton(
                    icon: Icon(
                      item.isInCart ? Icons.favorite : Icons.favorite,
                      color: item.isInCart ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      if (!item.isInCart) {
                        addToCart(item);
                      } else {
                        removeFromCart(item);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
