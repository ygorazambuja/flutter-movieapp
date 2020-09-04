import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/components/production_company_card.dart';
import 'package:yshare/domain/entities/production_companies.dart';

class ProductionCompaniesHorizontalList extends StatelessWidget {
  final List<ProductionCompanies> productionCompanies;

  const ProductionCompaniesHorizontalList({
    Key key,
    @required this.productionCompanies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Text('Production Companies',
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.only(top: 20),
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    topRight: Radius.circular(100)),
                color: Colors.indigo[400]),
            child: Container(
              height: 200,
              child: ListView.builder(
                itemCount: productionCompanies.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ProductionCompanyCard(
                  productionCompany: productionCompanies[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
