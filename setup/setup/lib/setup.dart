// import 'package:flutter/material.dart';
//
// class badal extends StatelessWidget {
//   const badal({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text("Jay");
//   }
// }
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyRecipeApp());
// }
//
// class MyRecipeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Recipe App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: RecipeHomePage(),
//     );
//   }
// }

class RecipeHomePage extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe('Spaghetti Carbonara', 'Italian', 'assets/spaghetti_carbonara.jpg'),
    Recipe('Chicken Curry', 'Indian', 'assets/chicken_curry.jpg'),
    Recipe('Chocolate Cake', 'Dessert', 'assets/chocolate_cake.jpg'),
    Recipe('Caesar Salad', 'Salad', 'assets/caesar_salad.jpg'),
    Recipe('Sushi Rolls', 'Japanese', 'assets/sushi_rolls.jpg'),
    Recipe('Guacamole', 'Mexican', 'assets/guacamole.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? RecipeList(recipes: recipes)
              : RecipeGrid(recipes: recipes);
        },
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;

  RecipeList({required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(recipes[index].name),
          subtitle: Text(recipes[index].category),
          leading: CircleAvatar(
            backgroundImage: AssetImage(recipes[index].image),
          ),
        );
      },
    );
  }
}

class RecipeGrid extends StatelessWidget {
  final List<Recipe> recipes;

  RecipeGrid({required this.recipes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return GridTile(
          child: Image.asset(
            recipes[index].image,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(recipes[index].name),
            subtitle: Text(recipes[index].category),
          ),
        );
      },
    );
  }
}

class Recipe {
  final String name;
  final String category;
  final String image;

  Recipe(this.name, this.category, this.image);
}
