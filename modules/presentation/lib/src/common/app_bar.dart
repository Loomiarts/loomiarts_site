import 'package:flutter/material.dart' as material;

class AppBar extends material.StatefulWidget implements material.PreferredSizeWidget {

  const AppBar({super.key});

  @override
  material.State<material.StatefulWidget> createState() {
    return _AppBarState();
  }
  
  @override
  material.Size get preferredSize => const material.Size.fromHeight(material.kToolbarHeight);
}

class _AppBarState extends material.State<AppBar> {

  @override
  material.Widget build(material.BuildContext context) {
    return material.AppBar(
      actions: [
        material.IconButton(
          onPressed: () {

          },
          icon: const material.Icon(material.Icons.language)
        )
      ],
    );
  }

}
