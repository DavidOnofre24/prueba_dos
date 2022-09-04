import 'package:flutter/material.dart';

import '../resources/colors.dart';

class HomeProducts extends StatefulWidget {
  const HomeProducts({Key? key}) : super(key: key);

  @override
  State<HomeProducts> createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
          child: Column(children: [
        _sectionGrey(),
      ])));

  AppBar _appBar() => AppBar(
      elevation: 0,
      actions: [
        Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.appGreenColor, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(children: const [
                  Icon(Icons.shopping_cart, color: AppColors.appGreenColor),
                  SizedBox(width: 10),
                  Text('0',
                      style: TextStyle(
                          color: AppColors.appGreenColor,
                          fontWeight: FontWeight.w800))
                ])))
      ],
      leadingWidth: 0,
      title: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
          child: const Text('Inicio',
              textAlign: TextAlign.left,
              style: TextStyle(color: AppColors.appTextColor))),
      leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Icon(Icons.home, color: AppColors.appIconColor)));

  Container _sectionGrey() => Container(
      color: AppColors.appBarColor,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      child: Column(children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(children: [
              const Icon(Icons.arrow_back,
                  color: AppColors.appGreenColor, size: 30),
              _searchField(),
              _searchButton()
            ])),
        _rowLocation()
      ]));

  Flexible _searchField() => Flexible(
      child: Container(
          height: 44,
          margin: const EdgeInsets.only(left: 10),
          child: const Material(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      isDense: true,
                      hintText: 'Buscar en Market')))));

  Container _searchButton() => Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          color: AppColors.appGreenColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: const Icon(Icons.search, color: Colors.white));

  Row _rowLocation() => Row(children: [
        const Icon(Icons.location_on_sharp, color: AppColors.appTextLightColor),
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 18),
                child: const Text('Consultar cobertura',
                    style: TextStyle(color: AppColors.appTextLightColor)))),
        const Icon(Icons.keyboard_arrow_down,
            size: 30, color: AppColors.appTextLightColor)
      ]);
}
