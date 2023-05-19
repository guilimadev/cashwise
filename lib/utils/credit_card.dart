// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.all(Radius.circular(60))),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.credit_card,
                        size: size.height * 0.04,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text(
                    'CARD NUMBER',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text('3829 4820',
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Guilherme Lima',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
