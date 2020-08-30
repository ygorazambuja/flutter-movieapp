import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class FormSearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: TextFormField(
        onFieldSubmitted: (value) =>
            Modular.to.pushNamed('/searchFilmPage/$value'),
        style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black45,
            contentPadding: EdgeInsets.all(14),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              gapPadding: 12,
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: 'Search movies / tv series',
            labelStyle: TextStyle(color: Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: Icon(EvaIcons.search)),
      ),
    ));
  }
}
