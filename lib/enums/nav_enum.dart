import 'package:flutter/material.dart';

enum NavEnum {
  search(Icons.search),
  sms(Icons.sms),
  home(Icons.pentagon_rounded),
  favorite(Icons.favorite_rounded),
  profile(Icons.person);

  final IconData icon;

  const NavEnum(this.icon);
}

extension NavEnumX on NavEnum {
  bool get isSearch => this == NavEnum.search;
  bool get isSms => this == NavEnum.sms;
  bool get isHome => this == NavEnum.home;
  bool get isFavorite => this == NavEnum.favorite;
  bool get isProfile => this == NavEnum.profile;
}
