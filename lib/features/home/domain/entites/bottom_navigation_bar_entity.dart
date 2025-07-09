class BottomNavigationBarEntity {
  final String inActiveIcon, activeIcon;
  final String name;

  BottomNavigationBarEntity({
    required this.inActiveIcon,
    required this.activeIcon,
    required this.name,
  });

  static List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
    BottomNavigationBarEntity(
      inActiveIcon: 'assets/images/home.svg',
      activeIcon: 'assets/images/home-active.svg',
      name: 'الرئيسية',
    ),
    BottomNavigationBarEntity(
      inActiveIcon: 'assets/images/products.svg',
      activeIcon: 'assets/images/products-active.svg',
      name: 'المنتجات',
    ),
    BottomNavigationBarEntity(
      inActiveIcon: 'assets/images/shopping-cart.svg',
      activeIcon: 'assets/images/shopping-cart-active.svg',
      name: 'سلة التسوق',
    ),
    BottomNavigationBarEntity(
      inActiveIcon: 'assets/images/user.svg',
      activeIcon: 'assets/images/user-active.svg',
      name: 'حسابي',
    ),

  ];
}
