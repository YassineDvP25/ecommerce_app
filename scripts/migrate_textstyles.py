import os
import re
from pathlib import Path

# Dictionary of TextStyle replacements
textstyle_replacements = {
    # Button styles
    r'TextStyle\(\s*fontSize:\s*18(?:\.sp)?,\s*fontWeight:\s*FontWeight\.bold,\s*color:\s*AppColors2\.white,\s*fontFamily:\s*\'SofiaSans\',\s*\)': 'AppTypography.buttonPrimary',
    r'TextStyle\(\s*color:\s*AppColors2\.white,\s*fontSize:\s*16,\s*fontWeight:\s*FontWeight\.bold,\s*\)': 'AppTypography.bodyLargeBold.copyWith(color: AppColors2.white)',
    r'TextStyle\(\s*color:\s*AppColors2\.black,\s*fontSize:\s*16,\s*fontWeight:\s*FontWeight\.bold,\s*\)': 'AppTypography.bodyLargeBold',

    # Title styles
    r'TextStyle\(\s*fontSize:\s*20,\s*fontWeight:\s*FontWeight\.bold,\s*color:\s*AppColors2\.black,\s*\)': 'AppTypography.titleLarge',
    r'TextStyle\(\s*fontSize:\s*18,\s*fontWeight:\s*FontWeight\.w600,\s*\)': 'AppTypography.titleMedium',
    r'TextStyle\(\s*fontSize:\s*16,\s*fontWeight:\s*FontWeight\.w600,\s*\)': 'AppTypography.titleSmall',

    # Body styles
    r'TextStyle\(\s*fontWeight:\s*FontWeight\.w500,\s*fontSize:\s*14,\s*\)': 'AppTypography.bodyMediumCustom',
    r'TextStyle\(\s*fontWeight:\s*FontWeight\.bold,\s*fontSize:\s*14,\s*\)': 'AppTypography.priceSmall',
    r'TextStyle\(\s*fontWeight:\s*FontWeight\.w600,\s*\)': 'AppTypography.quantity',

    # Caption styles
    r'TextStyle\(\s*color:\s*Colors\.grey,\s*fontSize:\s*12\s*\)': 'AppTypography.bodySmallCustom',
    r'TextStyle\(\s*color:\s*Colors\.grey,\s*fontWeight:\s*FontWeight\.w600\s*\)': 'AppTypography.link',

    # Input styles
    r'TextStyle\(\s*color:\s*AppColors2\.white\s*\)': 'AppTypography.input',
    r'TextStyle\(\s*color:\s*AppColors2\.white54\s*\)': 'AppTypography.hint',
    r'TextStyle\(\s*color:\s*AppColors2\.redAccent\s*\)': 'AppTypography.error',

    # Price styles
    r'TextStyle\(\s*fontSize:\s*18,\s*fontWeight:\s*FontWeight\.bold,\s*\)': 'AppTypography.priceLarge',
    r'TextStyle\(\s*fontSize:\s*16,\s*fontWeight:\s*FontWeight\.bold,\s*\)': 'AppTypography.priceMedium',

    # Simple styles
    r'TextStyle\(\s*fontSize:\s*18\s*\)': 'AppTypography.priceLarge.copyWith(fontWeight: FontWeight.normal)',
    r'TextStyle\(\s*fontWeight:\s*FontWeight\.bold\s*\)': 'AppTypography.bodyLargeBold.copyWith(fontSize: 14)',
}

def migrate_textstyles_in_file(file_path):
    """Migrate TextStyle usages to AppTypography constants in a single file."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        original_content = content
        changes_made = 0

        # Apply replacements in order (longer patterns first to avoid partial matches)
        for pattern, replacement in sorted(textstyle_replacements.items(), key=lambda x: len(x[0]), reverse=True):
            new_content = re.sub(pattern, replacement, content, flags=re.MULTILINE | re.DOTALL)
            if new_content != content:
                changes_made += len(re.findall(pattern, content, flags=re.MULTILINE | re.DOTALL))
                content = new_content

        if content != original_content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            return changes_made
        return 0

    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        return 0

def main():
    """Main function to migrate TextStyles across the project."""
    project_root = Path(__file__).parent.parent
    lib_dir = project_root / 'lib'

    total_changes = 0
    files_processed = 0

    # Find all Dart files in lib directory
    for dart_file in lib_dir.rglob('*.dart'):
        if dart_file.is_file():
            changes = migrate_textstyles_in_file(dart_file)
            if changes > 0:
                print(f"Updated {dart_file.relative_to(project_root)}: {changes} replacements")
                total_changes += changes
                files_processed += 1

    print(f"\nMigration complete!")
    print(f"Files processed: {files_processed}")
    print(f"Total TextStyle replacements: {total_changes}")

if __name__ == "__main__":
    main()