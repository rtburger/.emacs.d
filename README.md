# Emacs Configuration
This repository contains a basic Emacs setup intended primarily for Clojure development, though it's versatile enough to be adapted to various purposes. New Emacs users, or those looking to explore a new setup, may find this configuration to be a clean and efficient starting point.

## Overview
### Basic Editor Settings
- Startup screen is disabled
- Line numbers are enabled globally
- Single-line scrolling
- Highlight the current line (in GUI mode)
- Bell function is silenced
- Keybindings are defined for easier navigation and action
- Bash is set as the default shell for ansi-term
- Backups and auto-saves are stored in specific directories

### Custom File Settings
- `custom-file` is set to prevent polluting the init file
- Custom configurations are loaded from `custom-file.el`

### Package Management
- Package system initialized
- MELPA is added to the package archives
- `use-package` is ensured to be installed

### Package Configurations
Several packages are configured for better utility and UX:
- `spacemacs-theme`: For eye-candy appearance
- `which-key`: To provide helpful keybinding prompts
- `company`: For autocompletion
- `magit`: To integrate Git
- `paredit`: For structured editing (see Note)
- `rainbow-delimiters`: To colorize parentheses
- `clojure-mode`: To aid Clojure development
- `cider`: To provide a robust Clojure IDE experience

**NOTE**
Paredit, a tool for structured editing in Lisp, is disabled to simplify initial use. Consider enabling it as you get acquainted with Emacs, and check the [documentation](https://www.emacswiki.org/emacs/ParEdit) for in-depth knowledge.

## Getting Started
**Clone the Repository**: 
   ```shell
   git clone git@github.com:rtburger/.emacs.d.git ~/.emacs.d
   ```
## Acknowledgments
Special thanks to the creators and maintainers of the utilized packages, and to the open-source community for providing invaluable resources and support.

- [GNU Emacs](https://www.gnu.org/software/emacs/)
- [System Crafters on YouTube](https://www.youtube.com/c/SystemCrafters)
- [Uncle Dave on YouTube](https://www.youtube.com/c/uncledave)

Happy Coding!