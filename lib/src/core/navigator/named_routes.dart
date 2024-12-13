enum NamedRoutes {
  splash('/'),
  dashboard('/dashboard'),
  dataCollection('/dataCollection');

  final String routeName;

  const NamedRoutes(this.routeName);
}
