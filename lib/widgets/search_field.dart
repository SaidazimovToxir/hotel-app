import 'package:exam2/pages/home_pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MySearchField extends StatefulWidget {
  final bool checkButtonOrField;
  final Function(String)? onSearch;

  const MySearchField({
    super.key,
    required this.checkButtonOrField,
    this.onSearch,
  });

  @override
  State<MySearchField> createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.10),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: widget.checkButtonOrField
          ? TextField(
              onChanged: widget.onSearch,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Search by Address, City, or ZIP',
                hintStyle: const TextStyle(
                  color: Color(0xff95A2B0),
                  fontSize: 14,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset("assets/icons/search_icon.svg"),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset("assets/icons/search_icon.svg"),
                    ),
                    const Text(
                      'Search by Address, City, or ZIP',
                      style: TextStyle(
                        color: Color(0xff95A2B0),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
