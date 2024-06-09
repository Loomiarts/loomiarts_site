import 'package:flutter/material.dart';

/// The component used to show each game and the about tile in the home screen.
class HomeTile extends StatelessWidget {

  final String imageAsset;
  final String title;

  const HomeTile({super.key, required this.title, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary
    );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: PhysicalModel(
        color: Colors.black,
        elevation: 8,
        //child: AspectRatio(
        //  aspectRatio: 0.73,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image.asset(
                  imageAsset,
                  fit: BoxFit.fill,
                ),
                Container(
                  color: theme.colorScheme.primary.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(title, style: titleStyle,)
                  ),
                )
              ],
            )
          ),
        //),
      ),
    );
  }
  
}
