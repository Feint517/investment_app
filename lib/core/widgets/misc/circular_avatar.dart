import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/colors.dart';

enum AvatarSize { extraSmall, small, medium, large }

class CustomCircularAvatar extends StatelessWidget {
  const CustomCircularAvatar({
    super.key,
    required this.imageUrl,
    this.size = AvatarSize.medium,
    this.onTap,
  });

  final String imageUrl;
  final AvatarSize size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double avatarSize;
    switch (size) {
      case AvatarSize.extraSmall:
        avatarSize = 13.0;
        break;
      case AvatarSize.small:
        avatarSize = 30.0;
        break;
      case AvatarSize.medium:
        avatarSize = 40;
        break;
      case AvatarSize.large:
        avatarSize = 69.0;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.white.withValues(alpha: 0.7),
            width: 4.0,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            imageUrl,
            width: avatarSize,
            height: avatarSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
