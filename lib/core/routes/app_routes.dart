import 'package:djarna/presentation/features/auth/sign_in_screen.dart';
import 'package:djarna/presentation/features/auth/sign_up_screen.dart';
import 'package:djarna/presentation/features/auth/verify_number_screen.dart';
import 'package:djarna/presentation/features/dashbord/bottom_nav_bar/custom_bottombar.dart';
import 'package:djarna/presentation/features/dashbord/home/checkout_screen.dart';
import 'package:djarna/presentation/features/dashbord/home/make_offer_screen.dart';
import 'package:djarna/presentation/features/dashbord/home/payment_screen.dart';
import 'package:djarna/presentation/features/dashbord/home/product_details_screen.dart';
import 'package:djarna/presentation/features/dashbord/message/chat_details_screen.dart';
import 'package:djarna/presentation/features/dashbord/home/seller_profile_screen.dart';
import 'package:djarna/presentation/features/dashbord/home/search_filter_screen.dart';
import 'package:djarna/presentation/features/dashbord/profile/my_listings_screen.dart';
import 'package:djarna/presentation/features/dashbord/profile/edit_listing_screen.dart';
import 'package:djarna/presentation/features/dashbord/profile/favourite_item_screen.dart';
import 'package:djarna/presentation/features/dashbord/profile/invite_friends_screen.dart';
import 'package:djarna/presentation/features/dashbord/profile/personalization_screen.dart';
import 'package:djarna/presentation/features/dashbord/profile/djarna_guide_screen.dart';
import 'package:djarna/presentation/features/dashbord/home/fashion_category_screen.dart';
import 'package:djarna/presentation/features/dashbord/home/sub_category_screen.dart';
import 'package:djarna/presentation/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Route Name Constants
  static const String splash = "/";
  static const String sign_in = SignInScreen.name;
  static const String sign_up = SignUpScreen.name;
  static const String verify_number = VerifyNumberScreen.name;
  static const String custom_bottom_bar = CustomBottomBar.name;
  static const String product_details = ProductDetailsScreen.name;
  static const String checkOut = CheckoutScreen.name;
  static const String payment = PaymentScreen.name;
  static const String chat_details = ChatDetailsScreen.name;
  static const String make_offer = MakeAnOfferScreen.name;
  static const String seller_profile = SellerProfileScreen.name;
  static const String my_listings = MyListingsScreen.name;
  static const String search_filter = SearchFilterScreen.name;
  static const String edit_listing = EditListingScreen.name;
  static const String favourite_item = FavouriteItemScreen.name;
  static const String invite_friends = InviteFriendsScreen.name;
  static const String personalization = PersonalizationScreen.name;
  static const String djarna_guide = DjarnaGuideScreen.name;
  static const String fashion_category = FashionCategoryScreen.name;
  static const String sub_category = SubCategoryScreen.name;

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    sign_in: (context) => const SignInScreen(),
    sign_up: (context) => const SignUpScreen(),
    verify_number: (context) => const VerifyNumberScreen(),
    custom_bottom_bar: (context) => const CustomBottomBar(),
    product_details: (context) => const ProductDetailsScreen(),
    checkOut: (context) => const CheckoutScreen(),
    payment: (context) => const PaymentScreen(),
    //chat details screen and make offer screen spacial case
    chat_details: (context) {
      final args = ModalRoute.of(context)!.settings.arguments;
      final bool isTransactional = args is bool ? args : false;
      return ChatDetailsScreen(isTransactional: isTransactional);
    },
    make_offer: (context) => const MakeAnOfferScreen(),
    seller_profile: (context) => const SellerProfileScreen(),
    my_listings: (context) => const MyListingsScreen(),
    search_filter: (context) => const SearchFilterScreen(),
    edit_listing: (context) => const EditListingScreen(),
    favourite_item: (context) => const FavouriteItemScreen(),
    invite_friends: (context) => const InviteFriendsScreen(),
    personalization: (context) => const PersonalizationScreen(),
    djarna_guide: (context) => const DjarnaGuideScreen(),
    fashion_category: (context) => const FashionCategoryScreen(),
    sub_category: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as String;
      return SubCategoryScreen(title: args);
    },
  };
}
