import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/infrastructure.dart';
import 'about_router_impl.dart';

/// The view for the about page.
class AboutPage extends StatefulWidget {

  const AboutPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return AboutPageState();
  }
}

/// The view state for the about page.
class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final titlesStyle = theme.textTheme.headlineLarge;
    final bodyStyle = theme.textTheme.bodyLarge;

    final viewModel = AboutViewModel(AboutRouterImpl(), AboutRepositoryImpl());
    viewModel.load();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    'assets/loomiarts_logo_transparent.png',
                    alignment: Alignment.centerLeft,
                  )
                ),
                const SizedBox(height: 20),
                Text('Sobre', style: titlesStyle),
                const SizedBox(height: 20),
                Text(viewModel.about.text, style: bodyStyle),
                const SizedBox(height: 20),
                Text('Redes sociais', style: titlesStyle),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  children: [
                    for (var socialMediaLink in viewModel.about.socialMediaLinks)
                      ElevatedButton(
                        onPressed: () {
                          viewModel.openSocialMediaLink(socialMediaLink);
                        },
                        child: Text(socialMediaLink.name)
                      )
                  ],
                )
              ]
            ),
          ),
        )
      ),
    );
  }
  
}
