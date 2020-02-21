import 'package:daily_quotes/Screens/quotes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_quotes/Colors/rendomColor _generator.dart';

class QuotesInDetails extends StatefulWidget {
  final Quo value;

  QuotesInDetails({Key key, @required this.value}) : super(key: key);

  @override
  _QuotesInDetailsState createState() => _QuotesInDetailsState();
}

class _QuotesInDetailsState extends State<QuotesInDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quotes'),
      ),
      body: Container(
        margin: EdgeInsets.all(0),
        child: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 40, 30, 40),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
//                gradient: LinearGradient(
//                  colors: [
//                    UniqueColorGenerator.getColor(),
//                    UniqueColorGenerator.getColor(),
//                  ],
//                  begin: Alignment.topLeft,
//                  end: Alignment.bottomRight,
//                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: UniqueColorGenerator.getColor().withOpacity(0.5),
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    '${widget.value.selectedQuotesTitle}',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = UniqueColorGenerator.getColor(),
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    '${widget.value.selectedQuotesTitle}',
                    style: TextStyle(
                      fontSize: 30,
                      color: UniqueColorGenerator.getColor(),
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
