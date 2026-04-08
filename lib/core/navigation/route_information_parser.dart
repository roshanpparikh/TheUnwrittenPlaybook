/*
 * Copyright (c) 2021 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'ui_pages.dart';

class AppRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {

  const AppRouteInformationParser();

  @override
  Future<PageConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments.isEmpty) {
      return PageConfiguration.splash();
    }

    final path = '/${uri.pathSegments[0]}';
    switch (path) {


      case SplashPath || _:
        return PageConfiguration.splash();
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration) {
      case SplashPageConfiguration splash:
        return RouteInformation(uri: Uri.parse(SplashPath));
      case SettingsPageConfiguration settings:
        return RouteInformation(uri: Uri.parse(SettingsPath));

      case HostScreenConfiguration host:
        return RouteInformation(uri: Uri.parse(HostPath));
      case OnboardingPageConfiguration onboarding:
        return RouteInformation(uri: Uri.parse(OnboardingPath));
      case AppHasNewVersionPageConfiguration appUpdate:
        return RouteInformation(uri: Uri.parse(appUpdate.path));
      case CredentialsPageConfiguration credentials:
        return RouteInformation(uri: Uri.parse(credentials.path));
      case PersonalizationQuizPageConfiguration personalQuiz:
        return RouteInformation(uri: Uri.parse(personalQuiz.path));
      case ChapterPageConfiguration chapterPageConfiguration:
        return RouteInformation(uri: Uri.parse(chapterPageConfiguration.path));
      case WelcomePageConfiguration welcome:
        return RouteInformation(uri: Uri.parse(welcome.path));
      case ChapterQuizPageConfiguration quiz:
        return RouteInformation(uri: Uri.parse(quiz.path));
      case ProfilePageConfiguration profile:
        return RouteInformation(uri: Uri.parse(profile.path));
     case VoiceSelectionPageConfiguration configuration:
        return RouteInformation(uri: Uri.parse(configuration.path));
    }
  }
}
