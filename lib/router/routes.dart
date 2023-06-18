
enum Routes {
  auth("/"),
  home("/home");

  const Routes(this.path);

  final String path;
}
