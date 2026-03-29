from pathlib import Path
root = Path('.')
updated = 0
for f in root.rglob('*.dart'):
    text = f.read_text(encoding='utf-8')
    if 'AppColors2.' not in text:
        continue
    if 'package:ecommerce/core/theme/colors.dart' in text:
        continue
    lines = text.splitlines()
    insert_at = None
    for i, line in enumerate(lines):
        if line.startswith('import '):
            insert_at = i
    if insert_at is not None:
        lines.insert(insert_at + 1, "import 'package:ecommerce/core/theme/colors.dart';")
        f.write_text('\n'.join(lines), encoding='utf-8')
        updated += 1
print('added import to', updated, 'files')
