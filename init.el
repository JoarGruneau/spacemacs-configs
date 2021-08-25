;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation nil
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation nil
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of con(setq create-lockfiles nil)figuration layers to load.
   dotspacemacs-configuration-layers
   '(
     (ivy :variables ivy-enable-advanced-buffer-information nil)
     better-defaults
     ranger
     ;; emoji
     colors
     prodigy
     search-engine
     graphviz
     erlang
     (yaml :variables yaml-enable-lsp t)
     ;;syntax-checking
     (syntax-checking :variables syntax-checking-enable-by-default nil
                      syntax-checking-enable-tooltips nil)
     (spell-checking :variables spell-checking-enable-by-default nil)
     ;; (vinegar :variables vinegar-reuse-dired-buffer t)
     (spacemacs-layouts :variables layouts-enable-autosave nil
                        layouts-autosave-delay 300)
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (auto-completion :variables auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-tab-key-behavior nil
                      auto-completion-minimum-prefix-length 2
                      :disabled-for org markdown)
     restclient
     (gtags :disabled-for clojure emacs-lisp latex javascript python shell-script)
     (shell :variables shell-default-term-shell "/bin/bash")

     ;;       shell-default-term-shell "/bin/sh")
     docker
     ;; lsp
     ;; dap
     ;; latex
     pdf
     epub
     deft
     ;; (markdown :variables markdown-live-preview-engine 'vmd)
     markdown
     (org :variables org-want-todo-bindings t
          org-enable-hugo-support t)
     react
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyright
             python-formatter 'black
             python-format-on-save nil
             python-sort-imports-on-save nil
             ;; python-format-on-save nil
             python-test-runner '(pytest nose))
     ;; (ruby :variables ruby-version-manager 'chruby)
     ;; ruby-on-rails
     ;;lua
     html
     (tern :variables tern-disable-port-files nil)
     (javascript :variables javascript-disable-tern-port-files nil
                 ;; javascript-backend 'tern
                 javascript-fmt-tool 'prettier
                 javascript-fmt-on-save nil
                 js2-mode-show-strict-warnings nil)
     (typescript :variables
                 typescript-fmt-tool 'prettier
                 typescript-backend 'tide)
                 ;; typescript-linter 'tslint)
               ;; typescript-fmt-tool 'typescript-formatter)
     emacs-lisp
     racket
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(sicp ssh-agency sphinx-doc drag-stuff)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages
   '(org-brain
     magit-gh-pulls magit-gitflow  evil-mc realgud tern company-tern
                    evil-args evil-ediff evil-exchange evil-unimpaired
                    evil-indent-plus volatile-highlights smartparens
                    spaceline holy-mode skewer-mode rainbow-delimiters
                    highlight-indentation vi-tilde-fringe eyebrowse ws-butler
                    smooth-scrolling org-bullets org-repo-todo org-download org-timer
                    livid-mode git-gutter git-gutter-fringe  evil-escape
                    leuven-theme gh-md evil-lisp-state spray lorem-ipsum symon
                    ac-ispell ace-jump-mode auto-complete auto-dictionary
                    clang-format define-word google-translate disaster epic
                    fancy-battery org-present orgit orglue spacemacs-theme
                    helm-flyspell flyspell-correct-helm clean-aindent-mode
                    helm-c-yasnippet ace-jump-helm-line helm-make magithub
                    helm-themes helm-swoop helm-spacemacs-help smeargle
                    ido-vertical-mode flx-ido company-quickhelp ivy-rich helm-purpose
                    )
   ;; dotspacemacs-install-packages '(used-only)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light solarized-dark)
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                            :size 14
   ;;                            :weight normal
   ;;                            :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 10

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-init ()
	;; (setq-default configuration-layer-elpa-archives
    ;;   '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
    ;;     ("org-cn"   . "http://elpa.emacs-china.org/org/")
    ;;     ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  ;; (setq tramp-mode nil)
  ;; (setq tramp-ssh-controlmaster-options
  ;;       "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;; ss proxy. But it will cause anacond-mode failed.
  (setq warning-minimum-level :emergency)
  (setq socks-server '("Default server" "127.0.0.1" 1080 5))
  (setq evil-shift-round nil)
  (setq byte-compile-warnings '(not obsolete))
  (setq warning-minimum-level :error)
  (setq package-check-signature nil)
  (push "~/.spacemacs.d" load-path)
  )

(defun dotspacemacs/user-config ()
  (setq-default typescript-indent-level 2)
  (defun custom/highlight()
    (interactive)
    (web-mode)
    (typescript-mode)
    )
  (add-hook 'typescript-tsx-mode-hook 'custom/highlight)
  (add-hook 'rjsx-mode-hook 'typescript-mode)
  ;; (add-hook 'javascript-mode 'custom/highlight)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)


  ;; to get lsp to behave
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-sideline-enable nil)
  (defun custom/disable-lsp-diagnostics ()
    (setq-local lsp-diagnostic-package :none)
    )

  (defun python-toggle-breakpoint ()
     "Add a break point, highlight it."
     (interactive)
     (let ((trace "breakpoint()")
           (line (thing-at-point 'line)))
       (if (and line (string-match trace line))
           (kill-whole-line)
         (progn
           (back-to-indentation)
           (insert trace)
           (insert "\n")
           (python-indent-line)))))


  (defun custom/python-shell-run ()
    (interactive)
    (when (get-buffer-process "*Python*")
      (kill-process (get-buffer-process "*Python*"))
      (with-current-buffer "*Python*"
        (let ((comint-buffer-maximum-size 0))
          (comint-truncate-buffer))
        )
      (sleep-for 0.5)
      )
    (run-python (python-shell-parse-command) nil nil)
    (switch-to-buffer (other-buffer (current-buffer) t))
    (python-shell-send-buffer)
    (switch-to-buffer (other-buffer (current-buffer) t))
    )

  (add-hook 'python-mode-hook
            (lambda()
              (spacemacs/set-leader-keys-for-major-mode 'python-mode "db" 'python-toggle-breakpoint)
              (define-key python-mode-map (kbd "C-c C-c") 'custom/python-shell-run)
              ))



  (when (configuration-layer/layer-used-p 'lsp)
    (add-hook 'python-mode-hook 'custom/disable-lsp-diagnostics))

  ;; (global-set-key (kbd "TAB") 'hippie-expand)
  (remove-hook 'python-mode-hook 'spacemacs//init-eldoc-python-mode)
  (setq projectile-mode-line "Projectile")
  (defadvice projectile-project-root (around ignore-remote first activate)
    (unless (file-remote-p default-directory) ad-do-it))
  ;; (set-face-attribute 'default nil :font "-DAMA-Ubuntu Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1" :weight 'ultralight)
  ;; create no lock files
  (setq create-lockfiles nil)

  ;; treat underscore as part of a word
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'spacemacs-buffer-mode-hook (lambda ()
                                          (set (make-local-variable 'mouse-1-click-follows-link) nil)))
  ;; fix for evil search bug
  (defun kill-minibuffer ()
    (interactive)
    (when (windowp (active-minibuffer-window))
      (evil-ex-search-exit)))

  (add-hook 'mouse-leave-buffer-hook #'kill-minibuffer)
  (setq ibuffer-expert t)


  (add-hook 'dired-mode-hook
            (lambda ()
              (dired-hide-details-mode)))

  ;; dired no confirmation delete 
  (setq dired-deletion-confirmer '(lambda (x) t))
  ;; fix bug move select whole line
  (drag-stuff-mode t)
  (global-set-key (kbd "<C-S-up>") 'drag-stuff-up)
  (global-set-key (kbd "<C-S-down>") 'drag-stuff-down)

  (defun mark-from-point-to-end-of-line ()
    "Marks everything from point to end of line"
    (interactive)
    (set-mark (line-end-position))
    (activate-mark))

  ;;enable evil increase/decrease number
  (define-key evil-normal-state-map (kbd "å") 'mark-from-point-to-end-of-line)
  (define-key evil-normal-state-map (kbd "ä") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "ö") 'evil-numbers/dec-at-pt)

  (require 'parrot-rotate)
  (define-key evil-normal-state-map (kbd "t") 'parrot-rotate-next-word-at-point)
  (define-key evil-normal-state-map (kbd "T") 'parrot-rotate-prev-word-at-point)

  (require 'guild)


  ;;kill running processes in terminal
  (setq kill-buffer-query-functions
        (remq 'process-kill-buffer-query-function
              kill-buffer-query-functions))
  (fset 'evil-visual-update-x-selection 'ignore)
   ;; insert new line and move cursor down
  (define-key evil-normal-state-map (kbd "RET")
    (lambda ()
      (interactive)
      (call-interactively 'spacemacs/evil-insert-line-below)
      (evil-next-line)))
  ;; go to default gtags table
  ;; (setq spacemacs-default-jump-handlers
        ;; (remove 'evil-goto-definition spacemacs-default-jump-handlers))
  ;; force horizontal split window
  (setq split-width-threshold 120)
  (setq flycheck-python-flake8-executable "flake8")
  ;;ivy remove parent dir
  (setq ivy-extra-directories '("./"))
  ;; disable evil delete to copy to clip-board
  ;; (defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
  ;;   (apply orig-fn beg end type ?_ args))
  ;; (advice-add 'evil-delete :around 'bb/evil-delete)

  ;; (linum-relative-on)

  ;; (spacemacs|add-company-backends :modes text-mode)

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (define-key ivy-minibuffer-map (kbd "TAB") 'ivy-alt-done)

  ;; temp fix for ivy-switch-buffer
  ;; (spacemacs/set-leader-keys "bb" 'helm-mini)

  (global-hungry-delete-mode t)
  (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish spacemacs-whitespace-cleanup-mode)
  (spacemacs|diminish counsel-mode)

  (evilified-state-evilify-map special-mode-map :mode special-mode)

  (add-to-list 'auto-mode-alist
               '("Capstanfile\\'" . yaml-mode))
  ;;(setq ivy-sort-matches-functions-alist '((t . nil))
  (add-to-list
   'ivy-sort-matches-functions-alist
   '(counsel-find-file . ivy-sort-function-buffer))

  ;; (defun js-indent-line ()
  ;;   "Indent the current line as JavaScript."
  ;;   (interactive)
  ;;   (let* ((parse-status
  ;;           (save-excursion (syntax-ppss (point-at-bol))))
  ;;          (offset (- (point) (save-excursion (back-to-indentation) (point)))))
  ;;     (if (nth 3 parse-status)
  ;;         'noindent
  ;;       (indent-line-to (js--proper-indentation parse-status))
  ;;       (when (> offset 0) (forward-char offset)))))

  ;; (global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
  ;; (defun un-indent-by-removing-4-spaces ()
  ;;   "remove 4 spaces from beginning of of line"
  ;;   (interactive)
  ;;   (save-excursion
  ;;     (save-match-data
  ;;       (beginning-of-line)
  ;;       ;; get rid of tabs at beginning of line
  ;;       (when (looking-at "^\\s-+")
  ;;         (untabify (match-beginning 0) (match-end 0)))
  ;;       (when (looking-at (concat "^" (make-string tab-width ?\ )))
  ;;         (replace-match "")))))

  (defun zilongshanren/toggle-major-mode ()
    (interactive)
    (if (eq major-mode 'fundamental-mode)
        (set-auto-mode)
      (fundamental-mode)))
  (spacemacs/set-leader-keys "otm" 'zilongshanren/toggle-major-mode)

  (spacemacs/set-leader-keys "oo" 'poetry-venv-deactivate)
  (spacemacs/set-leader-keys "o=" 'custom/highlight)

  (setq which-key-allow-multiple-replacements nil)
  (spacemacs/declare-prefix-for-mode 'typescript-mode "m=" "custom/highlight")
  (spacemacs/set-leader-keys-for-major-mode 'typescript-mode "=" 'custom/highlight)
  ;(setq inhibit-compacting-font-caches t)

  (defun moon-override-yank-pop (&optional arg)
    "Delete the region before inserting poped string."
    (when (and evil-mode (eq 'visual evil-state))
      (kill-region (region-beginning) (region-end))))

  (advice-add 'counsel-yank-pop :before #'moon-override-yank-pop)

  (defun evil-paste-after-from-+ ()
    (interactive)
    (let ((evil-this-register ?+))
      (call-interactively 'evil-paste-after)))

  (define-key evil-visual-state-map "p" 'evil-paste-after-from-+)
  (setq-default evil-kill-on-visual-paste nil)

  (setq ivy-more-chars-alist '((counsel-ag . 2)
                               (counsel-grep .2)
                               (t . 3)))

  (add-hook 'org-mode-hook 'auto-fill-mode)

  (with-eval-after-load 'transient
    (transient-bind-q-to-quit))
  )

(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
)
