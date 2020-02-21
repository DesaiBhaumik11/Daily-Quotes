import 'package:daily_quotes/API_Helper/api_helper.dart';
import 'package:daily_quotes/Model_Class/get_catagory_modelClass.dart';
import 'package:daily_quotes/Screens/quotes.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categor of Quotes'),
      ),
      body: FutureBuilder<Category>(
        future: ApiService.getQuotesCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final students = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data);
              return ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black87,
                        child: Text(
                          "${students.category[index].categoryName[0].toUpperCase()}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      trailing: Icon(Icons.chevron_right, size: 30),
                      title: Text(
                        '${students.category[index].categoryName}',
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        String categoryID = students.category[index].categoryId;
                        String categoryName =
                            students.category[index].categoryName;
                        String categoryImageURL =
                            students.category[index].categoryImage;
                        navigateToCategoryWiseQuotesScreen(
                            categoryID, categoryName, categoryImageURL);
                        print(categoryID);
                        print(categoryName);
                        print(categoryImageURL);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 2,
                    //color: Colors.grey[700],
                  );
                },
                itemCount: students.category.length,
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void navigateToCategoryWiseQuotesScreen(
      String categoryID, String categoryName, String categoryImageURL) {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => new QuotesWithCategory(
          value: Cat(
              selectedCategoryID: categoryID,
              selectedCategoryTitle: categoryName,
              selectedCategoryImage: categoryImageURL)),
    );
    Navigator.of(context).push(route);
  }
}

class Cat {
  final String selectedCategoryID, selectedCategoryTitle, selectedCategoryImage;

  const Cat(
      {this.selectedCategoryID,
      this.selectedCategoryTitle,
      this.selectedCategoryImage});
}
