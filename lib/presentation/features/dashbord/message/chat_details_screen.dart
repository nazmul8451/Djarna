import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ──────────────────────────────────────────────
// Simple message model
// ──────────────────────────────────────────────
enum _MsgType { text, offer }

class _ChatMessage {
  final String text;
  final bool isMe;
  final DateTime time;
  final _MsgType type;

  _ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
    this.type = _MsgType.text,
  });
}

// ──────────────────────────────────────────────
// Screen
// ──────────────────────────────────────────────
class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({super.key});

  static const String name = "/chat-details";

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showSafetyTip = true;

  // Tracks which message index has its timestamp shown (only one at a time)
  final Set<int> _expandedTimestamps = {};

  // Pre-seeded conversation
  final List<_ChatMessage> _messages = [
    _ChatMessage(
      text: "seller_intro",
      isMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 60)),
    ),
    _ChatMessage(
      text: "offer",
      isMe: true,
      time: DateTime.now().subtract(const Duration(minutes: 30)),
      type: _MsgType.offer,
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_ChatMessage(text: text, isMe: true, time: DateTime.now()));
      _messageController.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _toggleTimestamp(int index) {
    setState(() {
      if (_expandedTimestamps.contains(index)) {
        _expandedTimestamps.remove(index);
      } else {
        _expandedTimestamps.clear(); // only one at a time like Messenger
        _expandedTimestamps.add(index);
      }
    });
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final m = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildProductSection(),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          Expanded(child: _buildChatMessages()),
          if (_showSafetyTip) _buildSafetyTip(),
          _buildMessageInput(),
        ],
      ),
    );
  }

  // ── AppBar ──────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 20.sp, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        children: [
          Text(
            "Noobmaster69",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8.w,
                height: 8.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF4CAF50),
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                "Online",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF4CAF50),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.more_horiz, color: Colors.black, size: 24.sp),
          onPressed: () {},
        ),
      ],
    );
  }

  // ── Product section ──────────────────────────
  Widget _buildProductSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: AppColors.backgroundLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  'assets/images/yellow_silk.png',
                  width: 60.w,
                  height: 60.w,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.image, color: Colors.grey, size: 30.sp),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Puzzle Clementoni Museum Collection",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "€9.00",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Icon(
                          Icons.shield_outlined,
                          size: 12.sp,
                          color: const Color(0xFF4CAF50),
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          "€10.15 Includes Buyer Protection",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xFF4CAF50),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.make_offer),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black, width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Text(
                    "Make an offer",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.checkOut),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB58322),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    elevation: 0,
                  ),
                  child: Text(
                    "Buy now",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Message list ─────────────────────────────
  Widget _buildChatMessages() {
    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: _messages.length + 1, // +1 for translate row
      separatorBuilder: (_, __) => SizedBox(height: 8.h),
      itemBuilder: (context, index) {
        if (index == _messages.length) return _buildTranslateRow();
        final msg = _messages[index];
        if (!msg.isMe && msg.text == "seller_intro") {
          return _buildSellerIntroMessage(msg, index);
        }
        if (msg.isMe && msg.type == _MsgType.offer) {
          return _buildOfferMessage(msg, index);
        }
        return msg.isMe
            ? _buildMyTextMessage(msg, index)
            : _buildTheirTextMessage(msg, index);
      },
    );
  }

  // ── Timestamp helper widget ──────────────────
  Widget _timestampWidget(int index, DateTime time, {bool alignRight = true}) {
    final show = _expandedTimestamps.contains(index);
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: show
          ? Padding(
              padding: EdgeInsets.only(top: 4.h, left: alignRight ? 0 : 44.w),
              child: Align(
                alignment: alignRight
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  _formatTime(time),
                  style: TextStyle(fontSize: 11.sp, color: Colors.black38),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  // ── Seller intro bubble ──────────────────────
  Widget _buildSellerIntroMessage(_ChatMessage msg, int index) {
    return GestureDetector(
      onTap: () => _toggleTimestamp(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/profile_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                constraints: BoxConstraints(maxWidth: 220.w),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.r),
                    topRight: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, I'm liz6266",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 13.sp,
                          color: Colors.black45,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Italy, Verona",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 13.sp,
                          color: Colors.black45,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Last seen 55 min ago",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          _timestampWidget(index, msg.time, alignRight: false),
        ],
      ),
    );
  }

  // ── Offer bubble ─────────────────────────────
  Widget _buildOfferMessage(_ChatMessage msg, int index) {
    return GestureDetector(
      onTap: () => _toggleTimestamp(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(maxWidth: 250.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(2.r),
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "€9.00",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white54,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "€22,222.00",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB58322).withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      "Pending",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFFE6A832),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _timestampWidget(index, msg.time, alignRight: true),
        ],
      ),
    );
  }

  // ── My text bubble ───────────────────────────
  Widget _buildMyTextMessage(_ChatMessage msg, int index) {
    return GestureDetector(
      onTap: () => _toggleTimestamp(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(maxWidth: 250.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xFFB58322),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(2.r),
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: Text(
                msg.text,
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
            ),
          ),
          _timestampWidget(index, msg.time, alignRight: true),
        ],
      ),
    );
  }

  // ── Their text bubble ────────────────────────
  Widget _buildTheirTextMessage(_ChatMessage msg, int index) {
    return GestureDetector(
      onTap: () => _toggleTimestamp(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/profile_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                constraints: BoxConstraints(maxWidth: 220.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.r),
                    topRight: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Text(
                  msg.text,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                ),
              ),
            ],
          ),
          _timestampWidget(index, msg.time, alignRight: false),
        ],
      ),
    );
  }

  // ── Translate row ────────────────────────────
  Widget _buildTranslateRow() {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.translate, size: 16.sp, color: const Color(0xFFB58322)),
            SizedBox(width: 6.w),
            Text(
              "Translate this conversation",
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFFB58322),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Safety tip ───────────────────────────────
  Widget _buildSafetyTip() {
    return Container(
      color: const Color(0xFFFFF8E7),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: [
          Icon(
            Icons.shield_outlined,
            size: 18.sp,
            color: const Color(0xFFB58322),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stay safe on DJARNA. Don't share personal data, click on external links, or scan QR codes.",
                  style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                ),
                SizedBox(height: 2.h),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "More safety tips",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFFB58322),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _showSafetyTip = false),
            child: Icon(Icons.close, size: 18.sp, color: Colors.black45),
          ),
        ],
      ),
    );
  }

  // ── Message input bar ────────────────────────
  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.add_circle_outline,
                size: 26.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.camera_alt_outlined,
                size: 24.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: TextField(
                controller: _messageController,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _sendMessage(),
                decoration: InputDecoration(
                  hintText: "Write a message here",
                  hintStyle: TextStyle(fontSize: 14.sp, color: Colors.black38),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                ),
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: _sendMessage,
              child: Container(
                width: 42.w,
                height: 42.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFB58322),
                ),
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
