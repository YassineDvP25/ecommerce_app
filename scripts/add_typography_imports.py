import os
import re
from pathlib import Path

def add_typography_import(file_path):
    """Add AppTypography import to a Dart file if it uses AppTypography and doesn't already import it."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Check if file already imports AppTypography
        if 'typography.dart' in content or 'AppTypography' in content:
            return False

        # Check if file uses AppTypography
        if 'AppTypography.' not in content:
            return False

        # Find the last import line
        lines = content.split('\n')
        last_import_index = -1
        for i, line in enumerate(lines):
            if line.strip().startswith('import ') and line.strip().endswith(';'):
                last_import_index = i

        if last_import_index == -1:
            # No imports found, add after package imports or at top
            insert_index = 0
            for i, line in enumerate(lines):
                if line.strip().startswith('import ') or line.strip():
                    insert_index = i
                    break
        else:
            insert_index = last_import_index + 1

        # Add the import
        import_line = "import 'package:ecommerce/core/theme/typography.dart';"
        lines.insert(insert_index, import_line)

        # Write back
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines))

        return True

    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        return False

def main():
    """Main function to add typography imports across the project."""
    project_root = Path(__file__).parent.parent
    lib_dir = project_root / 'lib'

    files_updated = 0

    # Find all Dart files in lib directory
    for dart_file in lib_dir.rglob('*.dart'):
        if dart_file.is_file() and str(dart_file).endswith('.dart'):
            if add_typography_import(dart_file):
                print(f"Added import to {dart_file.relative_to(project_root)}")
                files_updated += 1

    print(f"\nImport addition complete!")
    print(f"Files updated: {files_updated}")

if __name__ == "__main__":
    main()