import 'package:flutter/material.dart';

import '../../../../Data/model/country.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key? key,
    required this.country,
    required this.theme,
  }) : super(key: key);

  final Country country;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 50,
            width: 50,
            child: Image.network(
              country.flag,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              country.name,
              style: TextStyle(
                  color: theme.colorScheme.onBackground),
            ),
            Text(
              country.capital == "NA"
                  ? "NA"
                  : country.capital[0],
              style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }
}
