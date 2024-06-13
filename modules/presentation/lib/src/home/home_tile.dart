import 'package:flutter/material.dart';

/// The component used to show each game and the about tile in the home screen.
class HomeTile extends StatelessWidget {

  final String imageAsset;
  final String title;
  final void Function() onTap;

  const HomeTile({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headlineMedium!.copyWith(
      color: Colors.white
    );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 20,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
          child: AspectRatio(
            aspectRatio: 0.73,
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Material(
                  color: Colors.white,
                  child: Ink.image(
                    image: AssetImage(imageAsset),
                    fit: BoxFit.fitWidth,
                    child: InkWell(
                      onTap: () {
                        onTap();
                      },
                    ),
                  ),
                ),
                IgnorePointer(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    verticalDirection: VerticalDirection.up,
                    children: [
                      Container(
                        color: const Color(0xFFA20033).withOpacity(0.8),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                          child: Text(title, style: titleStyle,)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
