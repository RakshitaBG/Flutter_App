import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}


class RestaurantApp extends StatelessWidget {

  const RestaurantApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner:false,

      theme:ThemeData(

        primarySwatch:Colors.deepOrange,

        scaffoldBackgroundColor:
        const Color(0xfff8f8f8),

      ),

      home:
      const MainScreen(),

    );
  }
}




class MainScreen extends StatefulWidget {

  const MainScreen({super.key});


  @override
  State<MainScreen> createState()
  => _MainScreenState();

}



class _MainScreenState extends State<MainScreen>{


int selectedIndex=0;


List<Map<String,dynamic>> cart=[];



final List<Map<String,dynamic>> foods=[


{
"name":"Grilled Chicken",
"description":"Juicy grilled chicken with special sauce",
"price":18.99,
"rating":"4.8",
"image":
"https://images.unsplash.com/photo-1532550907401-a500c9a57435"
},


{
"name":"Italian Pasta",
"description":"Creamy pasta with vegetables",
"price":12.99,
"rating":"4.6",
"image":
"https://images.unsplash.com/photo-1473093295043-cdd812d0e601"
},


{
"name":"Cheese Burger",
"description":"Classic burger with cheese",
"price":8.99,
"rating":"4.7",
"image":
"https://images.unsplash.com/photo-1568901346375-23c9450c58cd"
},


{
"name":"Chocolate Cake",
"description":"Hot lava chocolate dessert",
"price":6.99,
"rating":"4.9",
"image":
"https://images.unsplash.com/photo-1578985545062-69928b1d9587"
},


];





void addToCart(Map<String,dynamic> food){

setState((){

cart.add(food);

});

}




List<Widget> get pages=>[


homePage(),

cartPage(),

ordersPage(),

profilePage(),

];





@override
Widget build(BuildContext context){


return Scaffold(


body:
pages[selectedIndex],



bottomNavigationBar:



Container(

decoration:BoxDecoration(

color:Colors.white,

boxShadow:[

BoxShadow(

color:Colors.grey.shade300,

blurRadius:15,

)

]

),



child:
BottomNavigationBar(



currentIndex:selectedIndex,


type:
BottomNavigationBarType.fixed,


selectedItemColor:
Colors.deepOrange,


unselectedItemColor:
Colors.grey,



onTap:(index){

setState((){

selectedIndex=index;

});

},



items:[



const BottomNavigationBarItem(

icon:
Icon(Icons.home_outlined),

activeIcon:
Icon(Icons.home),

label:"Home",

),



BottomNavigationBarItem(

icon:
Badge(

label:
Text(""),
 
child:
Icon(Icons.shopping_cart_outlined),

),

activeIcon:
const Icon(Icons.shopping_cart),

label:
"Cart",

),



const BottomNavigationBarItem(

icon:
Icon(Icons.receipt_long_outlined),

activeIcon:
Icon(Icons.receipt_long),

label:"Orders",

),



const BottomNavigationBarItem(

icon:
Icon(Icons.person_outline),

activeIcon:
Icon(Icons.person),

label:"Profile",

),



],


),

),


);


}





// ---------------- HOME PAGE ----------------


Widget homePage(){


return SafeArea(


child:Padding(

padding:
const EdgeInsets.all(20),


child:Column(

crossAxisAlignment:
CrossAxisAlignment.start,


children:[



Row(

mainAxisAlignment:
MainAxisAlignment.spaceBetween,


children:[


const Column(

crossAxisAlignment:
CrossAxisAlignment.start,


children:[


Text(

"Hello Foodie 👋",

style:
TextStyle(

color:Colors.grey,

fontSize:16

),

),



Text(

"Find Your Favorite Food",

style:
TextStyle(

fontSize:25,

fontWeight:
FontWeight.bold,

),

),



],

),



CircleAvatar(

backgroundColor:
Colors.orange.shade100,


child:
const Icon(

Icons.person,

color:Colors.deepOrange,

),

)

],


),



const SizedBox(height:25),



Container(

padding:
const EdgeInsets.symmetric(
horizontal:15
),


decoration:
BoxDecoration(

color:Colors.white,

borderRadius:
BorderRadius.circular(20),

),


child:
const TextField(

decoration:

InputDecoration(

hintText:"Search food",

icon:
Icon(Icons.search),

border:
InputBorder.none,

),

),

),




const SizedBox(height:20),



const Text(

"Popular Menu",

style:
TextStyle(

fontSize:22,

fontWeight:
FontWeight.bold,

),

),



const SizedBox(height:10),




Expanded(

child:
ListView.builder(

itemCount:
foods.length,


itemBuilder:(context,index){


return foodCard(
foods[index]
);


},


),


)

],


),


),


);


}





Widget foodCard(Map<String,dynamic> food){


return Container(


margin:
const EdgeInsets.only(bottom:20),


decoration:
BoxDecoration(

color:Colors.white,

borderRadius:
BorderRadius.circular(25),


),



child:Column(

children:[



ClipRRect(

borderRadius:
const BorderRadius.vertical(
top:Radius.circular(25)
),


child:
Image.network(

food["image"],

height:170,

width:double.infinity,

fit:BoxFit.cover,

),

),



Padding(

padding:
const EdgeInsets.all(15),


child:
Column(

crossAxisAlignment:
CrossAxisAlignment.start,


children:[


Text(

food["name"],

style:
const TextStyle(

fontSize:20,

fontWeight:
FontWeight.bold,

),

),


Text(

food["description"],

style:
const TextStyle(
color:Colors.grey
),

),



Row(

mainAxisAlignment:
MainAxisAlignment.spaceBetween,


children:[


Text(

"\$${food["price"]}",

style:
const TextStyle(

fontSize:20,

fontWeight:
FontWeight.bold,

color:Colors.deepOrange,

),

),



ElevatedButton(

style:
ElevatedButton.styleFrom(

backgroundColor:
Colors.deepOrange,

),


onPressed:(){

addToCart(food);

},


child:
const Text(

"Add",

style:
TextStyle(
color:Colors.white
),

),

)

],


)


],


),


)


],


),


);


}





// ---------------- CART PAGE ----------------


Widget cartPage(){


double total=0;


for(var item in cart){

total+=item["price"];

}



return Scaffold(

appBar:AppBar(

title:
const Text("My Cart"),

backgroundColor:
Colors.deepOrange,

),


body:

cart.isEmpty?


const Center(

child:
Text(

"Cart is empty",

style:
TextStyle(fontSize:22),

),

)


:


Column(

children:[


Expanded(

child:
ListView.builder(

itemCount:
cart.length,


itemBuilder:(context,index){


return ListTile(

leading:
Image.network(

cart[index]["image"],

width:60,

fit:BoxFit.cover,

),


title:
Text(cart[index]["name"]),


trailing:
Text(
"\$${cart[index]["price"]}"
),


);

},


),

),



Padding(

padding:
const EdgeInsets.all(20),

child:
Text(

"Total : \$${total.toStringAsFixed(2)}",

style:
const TextStyle(

fontSize:22,

fontWeight:
FontWeight.bold,

),

),

)

],


),


);


}





Widget ordersPage(){


return const Center(

child:
Text(

"No Orders Yet 📦",

style:
TextStyle(

fontSize:25,

fontWeight:FontWeight.bold,

),

),

);


}





Widget profilePage(){


return const Center(

child:
Column(

mainAxisAlignment:
MainAxisAlignment.center,

children:[


CircleAvatar(

radius:50,

child:
Icon(

Icons.person,

size:50,

),

),



SizedBox(height:20),



Text(

"Food Lover",

style:
TextStyle(

fontSize:25,

fontWeight:
FontWeight.bold,

),

)


],


),

);


}



}