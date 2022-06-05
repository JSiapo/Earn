class Settings {
  final bool isDark;
  const Settings({required this.isDark});

  Settings copy({bool? isDark}) => Settings(isDark: isDark ?? this.isDark);
}
