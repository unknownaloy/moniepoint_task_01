import 'package:flutter/material.dart';

enum MapMenu {
  cosyAreas(
    Icons.beenhere_outlined,
    "Cosy areas",
  ),
  price(
    Icons.account_balance_wallet_outlined,
    "Price",
  ),
  infrastructure(
    Icons.shopping_basket_outlined,
    "Infrastructure",
  ),
  withoutAnyLayer(
    Icons.layers_outlined,
    "Without any layer",
  );

  final IconData icon;
  final String value;

  const MapMenu(
    this.icon,
    this.value,
  );
}

extension MapMenuX on MapMenu {
  bool get isCosyAreas => this == MapMenu.cosyAreas;
  bool get isPrice => this == MapMenu.price;
  bool get isInfrastructure => this == MapMenu.infrastructure;
  bool get isWithoutAnyLayer => this == MapMenu.withoutAnyLayer;
}
