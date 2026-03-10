import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});

  static const String name = "/seller-profile";

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const _goldColor = Color(0xFFB58322);
  static const _orangeColor = Color(0xFFE67E22);

  // Dummy product grid items with real images
  final List<String> _productImages = [
    'assets/images/Cosmétique.png',
    'assets/images/Headphones.png',
    'assets/images/Robelongue.png',
    'assets/images/Sneakers.png',
    'assets/images/yellow_silk.png',
    'assets/images/Headphones.png',
    'assets/images/Sneakers.png',
    'assets/images/Cosmétique.png',
  ];
  final List<String> _listings = List.generate(8, (i) => 'item_$i');
  final Set<int> _favoritedItems = {};

  void _toggleFavorite(int index) {
    setState(() {
      if (_favoritedItems.contains(index)) {
        _favoritedItems.remove(index);
      } else {
        _favoritedItems.add(index);
      }
    });
  }

  // Dummy reviews
  final _reviews = [
    {
      'user': 'sve129',
      'rating': 5,
      'time': '3 hours ago',
      'comment': 'ottimo',
      'seller_reply': 'pavone1977',
      'translate': true,
    },
    {
      'user': 'solly1973',
      'rating': 5,
      'time': 'a day ago',
      'comment': 'Articolo come da descrizione',
      'seller_reply': null,
      'translate': false,
    },
    {
      'user': 'marco_v',
      'rating': 4,
      'time': '2 days ago',
      'comment': 'Prodotto ottimo, spedizione veloce!',
      'seller_reply': null,
      'translate': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildListingsTab(),
                _buildReviewsTab(),
                _buildAboutTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── App Bar ──────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 20.sp, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'noobmaster69',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  // ── Tab bar ───────────────────────────────────
  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: _goldColor,
      unselectedLabelColor: Colors.black45,
      indicatorColor: _goldColor,
      indicatorWeight: 2.5,
      labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      tabs: const [
        Tab(text: 'Listings'),
        Tab(text: 'Reviews'),
        Tab(text: 'About'),
      ],
    );
  }

  // ════════════════════════════════════════════
  // TAB 1 — Listings
  // ════════════════════════════════════════════
  Widget _buildListingsTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile header
          _buildListingsHeader(),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          // Items count + filter row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '85 items',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.filter_list, size: 18.sp, color: _goldColor),
                    SizedBox(width: 4.w),
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: _goldColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.85,
            ),
            itemCount: _listings.length,
            itemBuilder: (_, i) => _buildProductCard(i),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildListingsHeader() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar + name + stats
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/seller_img.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -4,
                    child: Container(
                      width: 22.w,
                      height: 22.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: _goldColor,
                      ),
                      child: Center(
                        child: Text(
                          'M',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {}, // Future: Go to DJARNA info
                      child: Row(
                        children: [
                          Text(
                            'DJARNA',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w900,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14.sp,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    InkWell(
                      onTap: () =>
                          _tabController.animateTo(1), // Switch to Reviews tab
                      child: Row(
                        children: [
                          ...List.generate(
                            4,
                            (_) => Icon(
                              Icons.star,
                              size: 13.sp,
                              color: _orangeColor,
                            ),
                          ),
                          Icon(
                            Icons.star_half,
                            size: 13.sp,
                            color: _orangeColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '402 reviews',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: _goldColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    // FREQUENT UPLOADER badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE5D1),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.upload_rounded,
                            size: 12.sp,
                            color: _orangeColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'FREQUENT UPLOADER',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: _orangeColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          // Social / location
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Icon(Icons.verified_outlined, size: 15.sp, color: _goldColor),
                SizedBox(width: 6.w),
                Text(
                  'Facebook, Email',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 15.sp,
                  color: Colors.black45,
                ),
                SizedBox(width: 6.w),
                Text(
                  'Italy',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  '32 followers',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: _goldColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () {},
                child: Text(
                  '0 following',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: _goldColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          // Follow button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: _goldColor,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Follow',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          // Shop bundles card
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop bundles',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Save on postage',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white54),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _goldColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Create bundle',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }

  Widget _buildProductCard(int i) {
    return InkWell(
      onTap: () {}, // Future: Go to product details
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: AssetImage(_productImages[i % _productImages.length]),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // No more center number text
            Positioned(
              bottom: 8.h,
              right: 8.w,
              child: GestureDetector(
                onTap: () => _toggleFavorite(i),
                child: Container(
                  width: 28.w,
                  height: 28.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _favoritedItems.contains(i)
                        ? Colors.red.withValues(alpha: 0.7)
                        : Colors.white.withValues(alpha: 0.2),
                  ),
                  child: Icon(
                    _favoritedItems.contains(i)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (i == 1)
              Positioned(
                bottom: 8.h,
                right: 34.w,
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      '4',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ════════════════════════════════════════════
  // TAB 2 — Reviews
  // ════════════════════════════════════════════
  Widget _buildReviewsTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Big score
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              children: [
                Text(
                  '5.0',
                  style: TextStyle(
                    fontSize: 56.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                    height: 1,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (_) => Icon(Icons.star, size: 22.sp, color: _orangeColor),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '(402)',
                  style: TextStyle(fontSize: 14.sp, color: Colors.black45),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          // Sub-stats
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              children: [
                _reviewStatRow('Member reviews (281)', '5.0'),
                SizedBox(height: 10.h),
                _reviewStatRow('Automatic reviews (121)', '5.0'),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'How reviews work',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _goldColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          // Filter chips
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterChip('All', true),
                  SizedBox(width: 8.w),
                  _filterChip('From members', false),
                  SizedBox(width: 8.w),
                  _filterChip('Automatic', false),
                ],
              ),
            ),
          ),
          // Sort label
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'SORTED: NEWEST TO OLDEST',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.black38,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
          // Review list
          ..._reviews.map((r) => _buildReviewItem(r)).toList(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _reviewStatRow(String label, String score) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: Colors.black87),
          ),
          Row(
            children: [
              Text(
                score,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.star, size: 14.sp, color: _orangeColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _filterChip(String label, bool selected) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFF8E7) : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? _goldColor : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            color: selected ? _goldColor : Colors.black54,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildReviewItem(Map<dynamic, dynamic> r) {
    final rating = r['rating'] as int;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/seller_img.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        r['user'] as String,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (i) => Icon(
                            i < rating ? Icons.star : Icons.star_border,
                            size: 13.sp,
                            color: _orangeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  r['time'] as String,
                  style: TextStyle(fontSize: 12.sp, color: Colors.black38),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              r['comment'] as String,
              style: TextStyle(fontSize: 14.sp, color: Colors.black87),
            ),
            if (r['seller_reply'] != null) ...[
              SizedBox(height: 8.h),
              Row(
                children: [
                  Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/seller_img.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    r['seller_reply'] as String,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
            if (r['translate'] == true) ...[
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(Icons.translate, size: 14.sp, color: _goldColor),
                  SizedBox(width: 4.w),
                  Text(
                    'Tap to translate',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: _goldColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ════════════════════════════════════════════
  // TAB 3 — About
  // ════════════════════════════════════════════
  Widget _buildAboutTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover/profile photo
          Container(
            height: 220.h,
            width: double.infinity,
            color: Colors.grey[200],
            child: Image.asset(
              'assets/images/seller_img.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFFE8E4DF),
                child: Icon(Icons.person, size: 80.sp, color: Colors.grey[400]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'pavone1977',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: _goldColor,
                  ),
                ),
                SizedBox(height: 14.h),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 18.sp,
                        color: _goldColor,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Italy',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 18.sp,
                        color: _goldColor,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Last seen 3 hours ago',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.rss_feed_outlined,
                        size: 18.sp,
                        color: _goldColor,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '32 followers',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: _goldColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        '0 following',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: _goldColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _goldColor,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Follow',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
