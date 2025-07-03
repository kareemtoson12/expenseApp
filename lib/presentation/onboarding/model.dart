class OnboardingPageData {
  final String svgAsset;
  final String title;
  final String subtitle;
  OnboardingPageData({
    required this.svgAsset,
    required this.title,
    required this.subtitle,
  });
}

final List<OnboardingPageData> onboardingPages = [
  OnboardingPageData(
    svgAsset: 'assets/svg/on1.svg',
    title: 'Note Down Expenses',
    subtitle: 'Daily note your expenses to\nhelp manage money',
  ),
  OnboardingPageData(
    svgAsset: 'assets/svg/on2.svg',
    title: 'Simple Money Management',
    subtitle: 'Get your notifications or alert\nwhen you do the over expenses',
  ),
  OnboardingPageData(
    svgAsset: 'assets/svg/on3.svg',
    title: 'Easy to Track and Analize',
    subtitle: "Tracking your expense help make sure\nyou don't overspend",
  ),
];
