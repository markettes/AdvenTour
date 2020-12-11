import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:Adventour/models/Route.dart' as r;

class DynamicLinks {
  var _firebaseDynamicLinks = FirebaseDynamicLinks.instance;

  Future initDynamicLinks(Function onLink) async {
    final PendingDynamicLinkData data =
        await _firebaseDynamicLinks.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      onLink(deepLink);
    }

    _firebaseDynamicLinks.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;

      if (deepLink != null) {
        onLink(deepLink);
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  Future<String> dynamicLink(bool short, r.Route route) async {
    print('dynamic');
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://adventour.page.link',
      link: Uri.parse('https://adventour.page.link?id=${route.id}&author=${route.author}'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.Adventour',
        minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.google.FirebaseCppDynamicLinksTestApp.dev',
        minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: route.name,
        imageUrl: Uri.parse(route.image),
        description: 'Visualize this route in AdvenTour',
      ),
    );
    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await parameters.buildShortLink();
      url =  shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }
    print(parameters.uriPrefix +url.path);
    return parameters.uriPrefix +url.path;
  }

}

final DynamicLinks dynamicLinks = DynamicLinks();
