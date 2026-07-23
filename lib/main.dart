import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 233, 233),
        appBar: AppBar(
          title: const Text('Restaurant App'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: const ResturantMenuPage(),
      ),
    );
  }
}

class ResturantMenuPage extends StatelessWidget {
  const ResturantMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: const [
          Text(
            "Today's Special",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          SizedBox(height: 20),

          MenuItemCard(
            title: 'Grilled Salmon',
            description:
                'Freshly grilled salmon with lemon butter sauce.',
            price: 18.99,
            rating: 4.5,
            tag: "Chef's Special",
          ),

          SizedBox(height: 20),

          MenuItemCard(
            title: 'Pasta Primavera',
            description:
                'Pasta with fresh vegetables and a light tomato sauce.',
            price: 12.99,
            rating: 4.2,
            tag: 'Vegetarian',
          ),

          SizedBox(height: 20),

          MenuItemCard(
            title: 'Chocolate Lava Cake',
            description:
                'Warm chocolate cake with a gooey center.',
            price: 6.99,
            rating: 4.8,
            tag: 'Dessert',
          ),

          SizedBox(height: 20),

          MenuItemCard(
            title: 'Caesar Salad',
            description:
                'Crisp romaine lettuce with Caesar dressing and croutons.',
            price: 8.99,
            rating: 4.0,
            tag: 'Salad',
          ),
        ],
      ),
    );
  }
}
class MenuItemCard extends StatefulWidget {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String tag;

  const MenuItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.tag,
  });

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "\$${widget.price.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Text(
                  widget.rating.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                widget.tag,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Align(
              alignment: Alignment.bottomRight,
              child: quantity == 0
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          quantity = 1;
                        });
                      },
                      child: const Text("Order"),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                              } else {
                                quantity = 0;
                              }
                            });
                          },
                        ),
                        Text(
                          "$quantity",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}