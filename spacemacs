;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     chinese
     html
     auto-completion
     php
     emacs-lisp
     git
     markdown
     org
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (shell :variables
            shell-default-shell 'ansi-term
            shell-default-term-shell "/usr/local/bin/zsh")
     spell-checking
     syntax-checking
     version-control
     irc
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(mew mpv elfeed twittering-mode org-page simplenote2 hexrgb helm-github-stars)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         monokai
                         leuven
                         solarized-light
                         spacemacs-dark
                         spacemacs-light
                         solarized-dark
                         zenburn
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one).
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )
(defun dotspacemacs/config ()

  ;; load-path
  (add-to-list 'load-path "~/.site-elisp/")

  (require 'init-org-page)
  (require 'init-org)
  (require 'init-simplenote2)
  (require 'init-weibo)

  ;; display time
  (display-time-mode t)

  ;; helm-github-stars
  (setq helm-github-stars-username "venmos")

  ;; chinese layer
  (setq-default dotspacemacs-configuration-layers '((chinese :variables
                                                             chinese-enable-youdao-dict t
                                                             chinese-default-input-method 'pinyin)))

                                                             (setq pyim-dicts
                                                                   '((:name "dict1" :file "~/.site-elisp/plugin/pyim-bigdict.pyim" :coding utf-8-unix)))

  ;; osx switch key
  (setq mac-option-modifier 'hyper)
 ;;(setq mac-command-modifier 'meta)

  ;;
  (global-set-key (kbd "H->") 'mc/mark-next-like-this)
  (global-set-key (kbd "H-<") 'mc/mark-previous-like-this)

  ;; google-translate
  (global-set-key (kbd "H-8") 'google-translate-smooth-translate)
  (setq google-translate-translation-directions-alist
        '(("en" . "zh-CN") ("zh-CN" . "en")))

  ;; eww
  (with-eval-after-load 'eww
    (custom-set-variables
     '(eww-search-prefix "https://www.google.com.hk/search?q=")))

  (setq eww-download-directory "~/Downloads")
  (setq eww-form-checkbox-symbol "[ ]")
  (setq eww-form-checkbox-selected-symbol "[X]")

  ;; dired
  (require 'dired)
  ;; mpv player
  (define-key dired-mode-map (kbd "P")
    (lambda ()
      (interactive)
      (mpv-play (expand-file-name (dired-file-name-at-point)))))

  ;; elfeed
  ;; rss
  (require 'elfeed)

  (setq elfeed-feeds
        '(("http://www.bilibili.com/rss-13.xml" BiliBili)
          ("http://www.bilibili.com/rss-1.xml" BiliBili)
          ("http://www.bilibili.com/rss-3.xml" BiliBili)
          ))

  (defun elfeed-play-movie ()
    (interactive)
    (let ((link (elfeed-entry-link elfeed-show-entry)))
		  (cond ((string-match "^http:\\/\\/www\\.youtube\\.com" link)
             (message (concat "loading from youtube... " link))
             (call-process "mpv" nil nil nil link))
            ((string-match "^http:\\/\\/www\\.bilibili\\.com" link)
             (message (concat "loading from bilibili..." link))
             (call-process "bili" nil nil nil link)))))

  (define-key elfeed-show-mode-map (kbd "m") 'elfeed-play-movie)

  ;; yasnippet
  (require 'yasnippet)

  (yas/load-directory "~/.site-elisp/plugin/yasnippets")

  ;;; erc
  (defun erc-freenode ()
    "Log into freenode with less keystrokes"
    (interactive)
    (let
        ((password-cache nil))
      (erc-tls
       :server "banks.freenode.net"
       :port "6697"
       :nick "venmos"                ;set your username here
       :password (password-read (format "Hello venmos. welcome back to Freenode. Please enter your Password. ")))))

  (defun erc-gtalk ()
    (interactive)
    (erc-ssl
     :server "testing.bitlbee.org"
     :port "6668"
     :nick "venmos"
     :password (password-read (format "Hello venmos. welcome back to Gtalk. Please enter your Password. "))))

  ;; gnupg
  (epa-file-enable)
  (setq epa-file-encrypt-to nil)
  (setq epa-file-cache-passphrase-for-symmetric-encryption t)
  (setq epa-file-inhibit-auto-save nil)
  (setq pgg-default-scheme "gpg")
  (setq pgp-version 'gpg)
  (setq pgg-cache-passphrase nil)

  ;; twittering-mode
  ;; use-gnupg
  (setq twittering-use-master-password t)
  ;; icons-config
  (setq twittering-icon-mode t)
  (setq twittering-use-icon-storage t)

)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
