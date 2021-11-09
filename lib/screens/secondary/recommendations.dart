import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class Recommendation extends StatelessWidget {
  Recommendation({Key? key}) : super(key: key);
  final PageController _controller = PageController(initialPage: 0);
  final PageController _textcontroller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          child: PageView.builder(
            onPageChanged: (value) {
              getPage(value);
            },
            controller: _controller,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
                child: Image.asset(
                  'assets/images/home.jpg',
                  width: context.width,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 30.0, horizontal: context.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.055,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.0)),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: 'What are you looking for?',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: context.width * 0.04,
          top: context.height * 0.35,
          child: Container(
            height: context.height,
            width: context.width,
            child: PageView.builder(
              controller: _textcontroller,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recomendations',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white.withOpacity(0.7)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Women Blue Denim',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$30.00\t\t',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Colors.blue[200],
                                    fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '\$36.00',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  getPage(int page) {
    _controller.animateToPage(page,
        duration: Duration(milliseconds: 1000), curve: Curves.decelerate);
    _textcontroller.animateToPage(page,
        duration: Duration(milliseconds: 1000), curve: Curves.decelerate);
  }
}
