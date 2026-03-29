from pathlib import Path

root = Path('.')
updated = 0

for f in root.rglob('*.dart'):
    text = f.read_text(encoding='utf-8')
    if 'AppColors2.' not in text:
        continue
    if 'core/theme/colors.dart' in text:
        continue

    lines = text.splitlines()
    last_import_index = -1
    for i, line in enumerate(lines):
        if line.startswith('import '):
            last_import_index = i

    if last_import_index != -1:
        lines.insert(last_import_index + 1, "import 'package:ecommerce/core/theme/colors.dart';")
        f.write_text('\n'.join(lines), encoding='utf-8')
        updated += 1

print('added import to', updated, 'files')
