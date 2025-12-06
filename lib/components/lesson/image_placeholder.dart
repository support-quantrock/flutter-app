import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class ImagePlaceholder extends StatelessWidget {
  final String prompt;
  final String? imagePath;
  final double? height;
  final List<Color>? gradientColors;

  const ImagePlaceholder({
    super.key,
    required this.prompt,
    this.imagePath,
    this.height,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    // Calculate responsive height
    final responsiveHeight = height ?? Responsive.imageHeight(
      mobile: 200,
      tablet: 280,
      desktop: 350,
    );

    final borderRadius = Responsive.scale(16).clamp(12.0, 24.0);

    // If imagePath is provided, show the actual image
    if (imagePath != null && imagePath!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.maxContentWidth,
            maxHeight: responsiveHeight,
          ),
          child: Image.asset(
            imagePath!,
            height: responsiveHeight,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return _buildPlaceholder(context, responsiveHeight, borderRadius);
            },
          ),
        ),
      );
    }

    return _buildPlaceholder(context, responsiveHeight, borderRadius);
  }

  Widget _buildPlaceholder(BuildContext context, double height, double borderRadius) {
    final iconSize = Responsive.scale(48).clamp(36.0, 64.0);
    final titleFontSize = Responsive.fontSize(12).clamp(10.0, 16.0);
    final promptFontSize = Responsive.fontSize(12).clamp(10.0, 14.0);
    final padding = Responsive.scale(16).clamp(12.0, 24.0);

    return Container(
      height: height,
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: Responsive.maxContentWidth),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors ?? [
            const Color(0xFF1A1A2E),
            const Color(0xFF16213E),
            const Color(0xFF0F3460),
          ],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              size: iconSize,
              color: Colors.white.withValues(alpha: 0.4),
            ),
            SizedBox(height: Responsive.scale(12)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.scale(12),
                vertical: Responsive.scale(6),
              ),
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '🎨',
                    style: TextStyle(fontSize: Responsive.fontSize(14)),
                  ),
                  SizedBox(width: Responsive.scale(6)),
                  Text(
                    'AI Image Prompt',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Responsive.scale(12)),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  prompt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: promptFontSize,
                    color: Colors.white.withValues(alpha: 0.6),
                    height: 1.4,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
