import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';

class ImageNetworkBuilder extends StatelessWidget {
  const ImageNetworkBuilder(
    this.imageUrl, {
    Key? key,
    this.boxFit,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: boxFit,
      loadingBuilder: (context, child, loadingProgress) {
        double? currentProgress;

        if (loadingProgress != null) {
          int? totalBytes = loadingProgress.expectedTotalBytes;
          if (totalBytes != null) {
            currentProgress =
                (loadingProgress.cumulativeBytesLoaded / totalBytes).toDouble();
          }
        }

        if (loadingProgress == null) {
          return child;
        } else {
          return Container(
            color: AppColors.backgroundColor,
            child: Center(
              child: CircularProgressIndicator(
                value: currentProgress,
              ),
            ),
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.broken_image),
              Text(
                'imagem não encontrada',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 10),
              ),
            ],
          ),
        );
      },
    );
  }
}
