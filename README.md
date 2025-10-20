# AVIF Converter for macOS

Simple Finder Quick Actions to convert images to and from AVIF format.

## What is AVIF?

AVIF is a modern image format with excellent compression - typically 50% smaller than JPEG with better quality. More apps will support it over time, so these tools let you easily convert back and forth.

## Features

- **Convert to AVIF**: Convert JPG, PNG, WebP, and other formats to AVIF
- **Convert from AVIF**: Convert AVIF back to JPG for compatibility
- Right-click menu integration in Finder
- Batch conversion support (select multiple files)
- Original files are preserved

## Requirements

- macOS (tested on macOS 11+)
- libavif tools (`avifenc` and `avifdec`)

## Installation

### 1. Install libavif

**Option A - Homebrew (recommended):**
```bash
brew install libavif
```

**Option B - Download binaries:**
Visit https://github.com/AOMediaCodec/libavif/releases

### 2. Install Quick Actions

Double-click `install.sh` or run in Terminal:
```bash
cd /path/to/avif-converter
./install.sh
```

### 3. Restart Finder (if needed)

If Quick Actions don't appear immediately:
```bash
killall Finder
```

Or: Option+Right-click Finder icon in Dock → Relaunch

## Usage

1. Right-click any image file in Finder
2. Go to **Quick Actions** (or **Services**)
3. Select:
   - **Convert to AVIF** - Converts image to .avif format
   - **Convert from AVIF** - Converts .avif to .jpg

The converted file appears in the same directory with the new extension.

### Supported Input Formats

- Convert TO AVIF: JPG, PNG, WebP, TIFF, BMP, and more
- Convert FROM AVIF: AVIF only (outputs JPG)

## Batch Conversion

Select multiple files in Finder, right-click, and choose the conversion action. All selected files will be converted.

## Manual Conversion (Terminal)

If you prefer command-line:

```bash
# Convert to AVIF
avifenc input.jpg output.avif

# Convert from AVIF
avifdec input.avif output.jpg

# Quality control (0-63, lower = better quality)
avifenc --min 0 --max 63 input.jpg output.avif
```

## Uninstallation

Remove the Quick Actions:
```bash
rm -rf ~/Library/Services/"Convert to AVIF.workflow"
rm -rf ~/Library/Services/"Convert from AVIF.workflow"
```

## Troubleshooting

**Quick Actions don't appear:**
- Restart Finder: `killall Finder`
- Log out and back in
- Check System Preferences → Extensions → Finder

**"AVIF Tools Not Found" error:**
- Install libavif: `brew install libavif`
- Verify installation: `which avifenc`

**Conversion fails:**
- Make sure the file is a valid image format
- Check file permissions (must be readable)
- Try converting manually in Terminal to see error messages

## Technical Details

- Quick Actions use macOS Automator workflows
- Workflows check for libavif in `/opt/homebrew/bin/` and `/usr/local/bin/`
- Notifications show when conversion completes
- Error dialogs appear if libavif is not installed

## License

Public domain - use freely for any purpose.

## Credits

- Uses [libavif](https://github.com/AOMediaCodec/libavif) by AOMediaCodec
- Created with macOS Automator
