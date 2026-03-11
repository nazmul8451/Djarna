import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/core/constants/app_strings.dart';
import 'package:djarna/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int _selectedIndex = 0; // 0 for Messages, 1 for Notifications

  // Mock messaging state
  final List<Map<String, String>> _mockMessages = [
    {
      'name': 'Noobmaster69',
      'message': 'Is this still available?',
      'time': '2m ago',
      'image': 'assets/images/seller_img.png',
      'isOnline': 'true',
      'type': 'transactional',
    },
    {
      'name': 'Liz6266',
      'message': 'I would like to make an offer of 15,000 FCFA.',
      'time': '1h ago',
      'image': 'assets/images/profile_icon.png',
      'isOnline': 'false',
      'type': 'transactional',
    },
    {
      'name': 'Jean Dupont',
      'message': 'Can you send more photos?',
      'time': '3h ago',
      'image': 'assets/images/djarna_logo.png',
      'isOnline': 'true',
      'type': 'normal',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.inbox,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          _buildToggleSwitch(),
          Expanded(
            child: _selectedIndex == 1
                ? _buildNotificationsEmpty()
                : (_mockMessages.isEmpty ? _buildEmptyState() : _buildMessageList()),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      itemCount: _mockMessages.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: Colors.grey.withOpacity(0.1),
        indent: 80.w,
      ),
      itemBuilder: (context, index) {
        final msg = _mockMessages[index];
        return _buildMessageTile(msg);
      },
    );
  }

  Widget _buildMessageTile(Map<String, String> msg) {
    final bool isOnline = msg['isOnline'] == 'true';

    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.chat_details,
          arguments: false,
        );
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: Colors.grey[200],
            backgroundImage: AssetImage(msg['image']!),
          ),
          if (isOnline)
            Positioned(
              right: 2,
              bottom: 2,
              child: Container(
                width: 14.w,
                height: 14.w,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            msg['name']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          Text(
            msg['time']!,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Text(
          msg['message']!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.blueGrey,
          ),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14.sp,
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }

  Widget _buildToggleSwitch() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 40.h,
      decoration: BoxDecoration(
        color: const Color(0xFFEDF2F9), // Light blue-grey background for toggle
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = 0),
              child: Container(
                margin: EdgeInsets.all(4.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _selectedIndex == 0 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: _selectedIndex == 0
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                child: Text(
                  AppStrings.messages,
                  style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.black : Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = 1),
              child: Container(
                margin: EdgeInsets.all(4.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _selectedIndex == 1 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: _selectedIndex == 1
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                child: Text(
                  AppStrings.notifications,
                  style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.black : Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_messaging_icon.png',
            width: 250.w,
            height: 250.h,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.chat_bubble_outline,
              size: 150.sp,
              color: AppColors.buttonPrimary.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            AppStrings.readyToStartConversation,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            AppStrings.emptyMessageSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.blueGrey,
              height: 1.5,
            ),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to home or search
              },
              icon: const Icon(Icons.explore_outlined, color: Colors.white),
              label: Text(
                AppStrings.exploreListings,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                elevation: 10,
                shadowColor: AppColors.buttonPrimary.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsEmpty() {
    return Center(
      child: Text(
        "Pas encore de notifications",
        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
      ),
    );
  }
}
