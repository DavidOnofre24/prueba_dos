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
        _title(),
        _rowFilters(),
        _filterProduct(),
        Row(children: [_product(isCounter: true), _product()]),
        Row(children: [_product(), _product()]),
        Row(children: [_product(), _product()]),
        const SizedBox(height: 100)
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

  Container _title() => Container(
      margin: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
      alignment: Alignment.centerLeft,
      child: const Text('Snacks',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)));

  Container _filterProduct() => Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        alignment: Alignment.centerLeft,
        child: IntrinsicHeight(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      for (int i = 0; i < 10; i++) _filterProductCard(i == 3)
                    ]))),
      ));

  GestureDetector _filterProductCard(bool isSelect) => GestureDetector(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              color: isSelect ? AppColors.appIconColor : Colors.transparent,
              border: Border.all(
                  color: isSelect
                      ? AppColors.appIconColor
                      : AppColors.appTextLightColor),
              borderRadius: BorderRadius.circular(20)),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text('Todas',
                  style: isSelect ? const TextStyle(color: Colors.white) : null,
                  textAlign: TextAlign.center))));

  Row _rowFilters() => Row(children: [
        const SizedBox(width: 10),
        Expanded(
            child: Card(
                margin: EdgeInsets.zero,
                color: AppColors.appBarColor,
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Ordenar'),
                          SizedBox(width: 10),
                          Icon(Icons.swap_vert,
                              color: AppColors.appIconColor, size: 30)
                        ])))),
        const SizedBox(width: 10),
        Expanded(
            child: GestureDetector(
                onTap: _marcaOnTap,
                child: Card(
                    margin: EdgeInsets.zero,
                    color: AppColors.appBarColor,
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: const Text('Marcas')),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.appGreenColor,
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Container()))
                              ]),
                              const Icon(Icons.keyboard_arrow_down,
                                  color: AppColors.appIconColor, size: 30)
                            ]))))),
        const SizedBox(width: 10)
      ]);

  void _marcaOnTap() {
    Map<String, bool> values = {
      'lacanto': true,
      'Marca comercial': false,
      'lacantos': true,
      'Marca comercials': true,
      'lacantoa': true,
      'Marca comerciala': false,
    };
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        builder: (_) => Container(
            height: MediaQuery.of(context).size.height / 1.9,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            child: SafeArea(
                child: Column(children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 13, top: 13),
                      child: const CircleAvatar(
                          backgroundColor: AppColors.appTextLightColor,
                          maxRadius: 12,
                          child: Icon(Icons.close,
                              size: 15, color: Colors.white)))),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, left: 15),
                  child: const Text('Marcas',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 20))),
              Flexible(
                  child: StatefulBuilder(
                      builder: (context, set) => ListView(
                          padding: const EdgeInsets.only(top: 30),
                          itemExtent: 40,
                          children: values.keys
                              .map((key) => CheckboxListTile(
                                  title: Text(key,
                                      style: const TextStyle(
                                          color: AppColors.appTextLightColor)),
                                  value: values[key],
                                  activeColor: AppColors.appGreenColor,
                                  checkboxShape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: AppColors.appTextLightColor),
                                      borderRadius: BorderRadius.circular(5)),
                                  onChanged: (value) {
                                    set(() {
                                      values[key] = value!;
                                    });
                                  }))
                              .toList()))),
              const Divider(color: AppColors.appTextLightColor),
              _button('Filtrar (74 productos)')
            ]))));
  }

  Container _button(String text, {bool isCounter = false}) => Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: AppColors.appGreenColor,
              padding: const EdgeInsets.symmetric(vertical: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          child: isCounter
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Container(
                          margin: const EdgeInsets.only(left: 3),
                          child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              maxRadius: 15,
                              child: Icon(Icons.add,
                                  color: AppColors.appGreenColor))),
                      const Text('0', style: TextStyle(fontSize: 16)),
                      Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              maxRadius: 15,
                              child: Icon(Icons.remove,
                                  color: AppColors.appGreenColor)))
                    ])
              : Text(text)));

  Widget _product({bool isCounter = false}) => Container(
        margin: const EdgeInsets.only(left: 16, bottom: 10),
        child: Column(children: [
          SizedBox(
              width:
                  (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? MediaQuery.of(context).size.width / 2.3
                      : MediaQuery.of(context).size.width / 3,
              child: Builder(builder: (_) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Material(
                                elevation: 1,
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Image.asset('assets/2.png',
                                        fit: BoxFit.fill)))),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(top: 5, left: 5),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    color: AppColors.appGreenColor,
                                    child: const Text('En oferta',
                                        style:
                                            TextStyle(color: Colors.white)))))
                      ]),
                      Material(
                          elevation: 2,
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5))),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3) +
                                      const EdgeInsets.only(top: 2),
                              child: SizedBox(
                                  height: 170,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 5),
                                        const Text(
                                            'Nombre del producto sjdajdsakdjasdajsd adjsapdj ao',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3),
                                        const SizedBox(height: 2),
                                        const Text('12 gr',
                                            style: TextStyle(fontSize: 12)),
                                        const SizedBox(height: 2),
                                        const Text('Gozana',
                                            style: TextStyle(
                                                color:
                                                    AppColors.appGreenColor)),
                                        const SizedBox(height: 5),
                                        Wrap(children: [
                                          const Text('S/ 15.00',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900)),
                                          const SizedBox(width: 15),
                                          Container(
                                              margin:
                                                  const EdgeInsets.only(top: 3),
                                              child: Text('S/ 19.00',
                                                  style: const TextStyle(
                                                          fontSize: 12)
                                                      .copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough))),
                                          const SizedBox(height: 10),
                                          _button('Agregar',
                                              isCounter: isCounter)
                                        ]),
                                        const SizedBox(height: 5),
                                      ]))))
                    ]);
              }))
        ]),
      );
}
