(setq default-directory "~/" ; Start looking in the home directory when opening files
      vs-follow-symlinks t) ; Always follow symlinks
;; Save minibuffer prompt history
(savehist-mode 1)
(setq history-length 25 ; Store the past 25 minibuffer commands
      savehist-autosave-interval 600 ; Save minibuffer history every 10 minutes
      history-delete-duplicates t)
(recentf-mode 1) ; Store a list of recently opened files
(fset 'yes-or-no-p 'y-or-n-p) ; Ask "y/n?" instead of "yes/no?"
(which-key-mode +1)
