enum Routes {
  home(path: '/'),
  profile(path: '/profile'),
  article(path: '/article'),
  sign_in(path: '/login'),
  sign_up(path: '/register'),
  settings(path: '/settings');

  const Routes({
    required this.path,
  });

  final String path;
}