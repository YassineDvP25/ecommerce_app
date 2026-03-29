import pathlib
root = pathlib.Path('.')
replacements = {
    'Colors.transparent': 'AppColors2.transparent',
    'Colors.white': 'AppColors2.white',
    'Colors.white54': 'AppColors2.white54',
    'Colors.white70': 'AppColors2.white70',
    'Colors.black': 'AppColors2.black',
    'Colors.black12': 'AppColors2.black12',
    'Colors.black87': 'AppColors2.black87',
    'Colors.blue': 'AppColors2.blue',
    'Colors.deepPurple': 'AppColors2.deepPurple',
    'Colors.green': 'AppColors2.green',
    'Colors.grey': 'AppColors2.grey',
    'Colors.orange': 'AppColors2.orange',
    'Colors.red': 'AppColors2.red',
    'Colors.redAccent': 'AppColors2.redAccent',
    'Colors.yellow': 'AppColors2.yellow',
    'Color(0xFF000000)': 'AppColors2.black',
    'Color(0xFF00ACC1)': 'AppColors2.secondary',
    'Color(0xFF0F2A75)': 'AppColors2.deepBlue',
    'Color(0xFF1976D2)': 'AppColors2.info',
    'Color(0xFF1E1E1E)': 'AppColors2.surfaceDark',
    'Color(0xFF1E88E5)': 'AppColors2.primary',
    'Color(0xFF1F2024)': 'AppColors2.darkGrey',
    'Color(0xFF212121)': 'AppColors2.textPrimary',
    'Color(0xFF2D8C9F)': 'AppColors2.midTeal',
    'Color(0xFF2E7D32)': 'AppColors2.success',
    'Color(0xFF3F3F3F)': 'AppColors2.midGrey',
    'Color(0xFF42A5F5)': 'AppColors2.blue',
    'Color(0xFF606060)': 'AppColors2.darkBorder',
    'Color(0xFF6E6E6E)': 'AppColors2.textSecondary',
    'Color(0xFFBDBDBD)': 'AppColors2.border',
    'Color(0xFFD32F2F)': 'AppColors2.error',
    'Color(0xFFDB4437)': 'AppColors2.accentRed',
    'Color(0xFFEEEEEE)': 'AppColors2.divider',
    'Color(0xFFF2F2F2)': 'AppColors2.cardBackground',
    'Color(0xFFF3F3F3)': 'AppColors2.scaffoldBackgroundAlt',
    'Color(0xFFF5F5F5)': 'AppColors2.scaffoldBackground',
    'Color(0xFFF6F8FB)': 'AppColors2.background',
    'Color(0xFFF9A825)': 'AppColors2.warning',
    'Color(0xFFFFFFFF)': 'AppColors2.white',
    'Color(0xff0F2A75)': 'AppColors2.deepBlue',
    'Color(0xff2D8C9F)': 'AppColors2.midTeal',
    'Color(0xff4CD964)': 'AppColors2.brightGreen',
    'Color(0xffF5F6FA)': 'AppColors2.overlayBackground',
    'Color.fromARGB(255, 0, 0, 0)': 'AppColors2.black',
    'Color.fromARGB(255, 16, 17, 17)': 'AppColors2.blackHard',
    'Color.fromARGB(255, 245, 246, 247)': 'AppColors2.veryLight',
    'Color.fromARGB(255, 255, 90, 40)': 'AppColors2.peach',
    'Color.fromARGB(255, 42, 43, 43)': 'AppColors2.charcoal',
}
keys = sorted(replacements.keys(), key=lambda x: -len(x))
updated_files = 0
for f in (root).rglob('*.dart'):
    text = f.read_text(encoding='utf-8')
    new_text = text
    for k in keys:
        new_text = new_text.replace(k, replacements[k])
    if new_text != text:
        f.write_text(new_text, encoding='utf-8')
        updated_files += 1
print('updated files', updated_files)
