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
        color: Colors.white,
        elevation: 20,
        child: 
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
            child: AspectRatio(
              aspectRatio: 0.73,
              child: Stack(
                fit: StackFit.expand,
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    imageAsset,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Expanded(child: SizedBox()),
                      Container(
                        color: theme.colorScheme.primary.withOpacity(0.8),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                          child: Text(title, style: titleStyle,)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
  
}
