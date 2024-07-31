import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PhotoSlider extends StatefulWidget {
  final List<String> images;
  final double dotHeight;
  final double dotWidth;
  final Color activeDotColor;
  final Color dotColor;

  const PhotoSlider({super.key,
    required this.images,
    this.dotHeight = 8.0,
    this.dotWidth = 8.0,
    this.activeDotColor = Colors.orange,
    this.dotColor = Colors.grey,
  });

  @override
  _PhotoSliderState createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      width: width*(380/width),
      height: 144,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          SmoothPageIndicator(
            controller: _controller,
            count: widget.images.length,
            effect: WormEffect(
              dotHeight: widget.dotHeight,
              dotWidth: widget.dotWidth,
              activeDotColor: widget.activeDotColor,
              dotColor: widget.dotColor,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
