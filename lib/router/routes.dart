
enum Routes {
  auth("/"),
  add("/add"),
  pwd("/pwd"),
  home("/home");

  const Routes(this.path);

  final String path;
}
