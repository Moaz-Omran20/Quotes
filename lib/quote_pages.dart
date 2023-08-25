import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_api/api/api_service.dart';
import 'package:quotes_api/model/quotes_model.dart';

class QuotesPages extends StatefulWidget {
  @override
  State<QuotesPages> createState() => _QuotesPagesState();
}

class _QuotesPagesState extends State<QuotesPages> {
  int currentIndex = 0;

  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ApiService.fetchQuotes();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Quotes>(
          future: ApiService.fetchQuotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Quotes? quote = snapshot.data;
              return PageView.builder(
                controller: pageController,
                itemCount: quote!.results!.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.asset(
                        'assets/images/5.jpg',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Text(
                              '${quote.results![currentIndex].author}',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),

                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '“${quote.results![currentIndex].content}“',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 30, color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              'Page ${currentIndex + 1} of ${quote.results!.length}',
                              style: GoogleFonts.dancingScript(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
