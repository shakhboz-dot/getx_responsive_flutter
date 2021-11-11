import 'package:flutter/material.dart';

class SecondPageView extends StatelessWidget {
  PageController textcontroller;
  SecondPageView({Key? key, required this.textcontroller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: textcontroller,
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
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
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.blue[200], fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '\$36.00',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
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
    );
  }
}
