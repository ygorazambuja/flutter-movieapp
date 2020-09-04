import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/production_companies.dart';
import 'package:yshare/shared/constants.dart';

class ProductionCompanyCard extends StatelessWidget {
  final ProductionCompanies productionCompany;

  const ProductionCompanyCard({Key key, this.productionCompany})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            borderOnForeground: false,
            clipBehavior: Clip.antiAlias,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: productionCompany.logoPath != null
                  ? Image.network(
                      '$IMAGE_BASE_URL${productionCompany.logoPath}',
                      fit: BoxFit.fitWidth,
                      width: 120,
                      height: 120,
                    )
                  : Container(
                      width: 120,
                      height: 120,
                      color: Colors.white12,
                    ),
            ),
          ),
        ),
        productionCompany.name != null
            ? Text(
                '${productionCompany.name}',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.fade,
                maxLines: 2,
                softWrap: true,
              )
            : Container()
      ],
    );
  }
}
