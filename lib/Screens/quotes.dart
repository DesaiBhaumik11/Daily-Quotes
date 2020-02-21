import 'package:daily_quotes/API_Helper/api_helper.dart';
import 'package:daily_quotes/Model_Class/get_quotes_modelClass.dart';
import 'package:daily_quotes/Screens/catagory.dart';
import 'package:daily_quotes/Screens/qutoes_detail.dart';
import 'package:flutter/material.dart';

class QuotesWithCategory extends StatefulWidget {

  final Cat value;

  QuotesWithCategory({Key key, @required this.value}) : super(key: key);

  @override
  _QuotesWithCategoryState createState() => _QuotesWithCategoryState();
}

class _QuotesWithCategoryState extends State<QuotesWithCategory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.value.selectedCategoryTitle),
      ),
      body: FutureBuilder<Quotes>(
        future: ApiService.getCategoryViceQuotes(widget.value.selectedCategoryID),
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
                      title: Text('${students.quotes[index].quotesName}'??'No item Available',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        String quoteID = students.quotes[index].quotesId;
                        String quoteNAME = students.quotes[index].quotesName;
                        navigateToQuotesDetail(quoteID, quoteNAME);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 2,
                  );
                },
                itemCount: students.quotes.length,
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
  void navigateToQuotesDetail (String quoteID, String quoteNAME) {
    var route = MaterialPageRoute(
      builder: (BuildContext context) => QuotesInDetails(
        value : Quo(
          selectedQuotesID: quoteID,
          selectedQuotesTitle: quoteNAME,
        )
      )
    );
    Navigator.of(context).push(route);
  }
}

class Quo {

  final String selectedQuotesID,selectedQuotesTitle;

  const Quo({this.selectedQuotesID,this.selectedQuotesTitle});

}