import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:domain/domain.dart';
import 'package:infrastructure/infrastructure.dart';

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

    final i18nRepository = I18nRepositoryImpl(context);
    final currentLanguage = i18nRepository.currentLanguage;

    return material.AppBar(
      actions: [
        material.MenuAnchor(
          builder: (context, controller, child) {
            return material.IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const material.Icon(material.Icons.language)
            );
          },
          menuChildren: [
            for (var language in Language.values) 
              material.MenuItemButton(
                onPressed: () => i18nRepository.currentLanguage = language,
                trailingIcon: (
                  currentLanguage == language ? const material.Icon(material.Icons.check) : null
                ),
                child: Text(language.name),
              )
          ]
        ),
      ],
    );
  }

}
