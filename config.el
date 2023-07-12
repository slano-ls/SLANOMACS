;;(add-to-list 'default-frame-alist '(undecorated . t))

(setq user-full-name "Saihaj Law "
      user-mail-address "laws0817@gmail.com")

;;(use-package :autothemer)
;;(require 'nano-theme)
;;(require 'ef-themes)
(setq doom-theme 'doom-outrun-electric)
;;(setq +zen-text-scale 0.3)
;;(setq display-line-numbers-type 'relative)

;; (set-frame-parameter (selected-frame) 'alpha '(95 95))
;; (add-to-list 'default-frame-alist '(alpha 95 95))
 (require 'smooth-scroll)

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(add-hook! '+doom-dashboard-functions :append
(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))
(setq fancy-splash-image (concat doom-user-dir "vagabond.png")))

(setq-default line-spacing 0.24)
(modify-all-frames-parameters
'((right-divider-width . 10)
 (internal-border-width . 10)))
(dolist (face '(window-divider
               window-divider-first-pixel
                window-divider-last-pixel))
(face-spec-reset-face face)
(set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))
;;(good-scroll-mode 1)
(unless (equal "Battery status not available"
               (battery))
  (display-battery-mode 1))
(setq centaur-tabs-style "bar")
(setq centaur-tabs-height 32)
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-set-bar 'left)
(setq centaur-tabs-set-modified-marker t)
(after! centaur-tabs
  (setq centaur-tabs-set-bar 'right))

(use-package! theme-magic
  :commands theme-magic-from-emacs
  :config
  (defadvice! theme-magic--auto-extract-16-doom-colors ()
    :override #'theme-magic--auto-extract-16-colors
    (list
     (face-attribute 'default :background)
     (doom-color 'error)
     (doom-color 'success)
     (doom-color 'type)
     (doom-color 'keywords)
     (doom-color 'constants)
     (doom-color 'functions)
     (face-attribute 'default :foreground)
     (face-attribute 'shadow :foreground)
     (doom-blend 'base8 'error 0.1)
     (doom-blend 'base8 'success 0.1)
     (doom-blend 'base8 'type 0.1)
     (doom-blend 'base8 'keywords 0.1)
     (doom-blend 'base8 'constants 0.1)
     (doom-blend 'base8 'functions 0.1)
     (face-attribute 'default :foreground))))

(require 'ivy-posframe)
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
(ivy-posframe-mode 1)
(setq
  redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; (defun shaunsingh/apply-nano-theme (appearance)
;;   "Load theme, taking current system APPEARANCE into consideration."
;;   (mapc #'disable-theme custom-enabled-themes)
;;   (pcase appearance
;;     ('light (nano-light))
;;     ('dark (nano-dark))))
;; (use-package nano-theme
;;   :hook (after-init . nano-light)
;;   :config
;;   ;; If emacs has been built with system appearance detection
  ;; add a hook to change the theme to match the system
  ;; (if (boundp 'ns-system-appearance-change-functions)
  ;;     (add-hook 'ns-system-appearance-change-functions #'shaunsingh/apply-nano-theme))
  ;; Now to add some missing faces
;;   (custom-set-faces
;;    `(flyspell-incorrect ((t (:underline (:color ,nano-light-salient :style line)))))
;;    `(flyspell-duplicate ((t (:underline (:color ,nano-light-salient :style line)))))

;;    `(git-gutter:modified ((t (:foreground ,nano-light-salient))))
;;    `(git-gutter-fr:added ((t (:foreground ,nano-light-popout))))
;;    `(git-gutter-fr:modified ((t (:foreground ,nano-light-salient))))

;;    `(lsp-ui-doc-url:added ((t (:background ,nano-light-highlight))))
;;    `(lsp-ui-doc-background:modified ((t (:background ,nano-light-highlight))))

;;    `(vterm-color-red ((t (:foreground ,nano-light-critical))))
;;    `(vterm-color-blue ((t (:foreground ,nano-light-salient))))
;;    `(vterm-color-green ((t (:foreground ,nano-light-popout))))
;;    `(vterm-color-yellow ((t (:foreground ,nano-light-popout))))
;;    `(vterm-color-magenta ((t (:foreground ,nano-light-salient))))

;;    `(scroll-bar ((t (:background ,nano-light-background))))
;;    `(child-frame-border ((t (:foreground ,nano-light-faded))))

;;    `(avy-lead-face-1 ((t (:foreground ,nano-light-subtle))))
;;    `(avy-lead-face ((t (:foreground ,nano-light-popout :weight bold))))
;;    `(avy-lead-face-0 ((t (:foreground ,nano-light-salient :weight bold))))))
;;    (use-package! nano-modeline
;;      :hook (after-init . nano-modeline-mode)
;;      :config
;;      (setq nano-modeline-prefix 'status
;;            nano-modeline-prefix-padding 1
;;            nano-modeline-position 'bottom))

;; ;;(use-package! minions
 ;; :hook (after-init . minions-mode))

  ;;  (setq-default mode-line-format
   ;;                (cons (propertize "\u200b" 'display '((raise -0.35) (height 1.4))) mode-line-format))

(setq scroll-margin 2
      auto-save-default t
      display-line-numbers-type nil
      delete-by-moving-to-trash t
      truncate-string-ellipsis "…"
      browse-url-browser-function 'xwidget-webkit-browse-url)
(global-subword-mode 1)
;; Time Tracking
;;(use-package wakatime-mode
 ;; :diminish 'wakatime-mode
 ;; :init
  ;;(add-hook 'prog-mode-hook 'wakatime-mode)
  ;;:config (progn (setq wakatime-cli-path "/usr/local/bin/wakatime")
  ;;               (setq wakatime-api-key "waka_b0c3c9b1-a895-4f1a-8706-f6ce7f52869e")
  ;;               (setq wakatime-python-bin "/usr/local/bin/python")
  ;;               (global-wakatime-mode)))

(define-minor-mode prot/variable-pitch-mode
  "Toggle 'mixed-pitch-modei, except for programming modes"
  :init-value nil
  :global nil
  (if prot/variable-pitch-mode
      (unless (derived-mode-p 'prog-mode)
        (variable-pitch-mode 1))
    (variable-pitch-mode -1)))



(define-minor-mode prot/scroll-center-cursor-mode
  "Toggle centred cursor scrolling behavior"
  :init-value nil
  :lighter " S="
  :global nil
  (if prot/scroll-center-cursor-mode
      (setq-local scroll-margin (* (frame-height) 2)
                  scroll-conservatively 0
                  maximum-scroll-margin 0.5)
    (dolist (local '(scroll-preserve-screen-position
                     scroll-conservatively
                     maximum-scroll-margin
                     scroll-margin))
      (kill-local-variable `,local)))
  )

;; mu4e email
(after! mu4e
  (setq mu4e-index-cleanup nil
        mu4e-index-lazy-check t
        mu4e-update-interval 300)
  (set-email-account! "laws0817"
                      '((mu4e-sent-folder       . "/Sent Mail")
                        (mu4e-drafts-folder     . "/Drafts")
                        (mu4e-trash-folder      . "/Trash")
                        (mu4e-refile-folder     . "/All Mail")
                        (smtpmail-smtp-user     . "laws0817@gmail.com"))))
;; sending with smtpmail
(after! mu4e
  (setq sendmail-program "msmtp"
        send-mail-function #'smtpmail-send-it
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-send-mail-function #'message-send-mail-with-sendmail))

(setq doom-modeline-enable-word-count t)
(setq doom-modeline-modal t)

;;(use-package subed
 ;; :ensure t
 ;; :config
  ;; Disable automatic movement of point by default
 ;; (add-hook 'subed-mode-hook 'subed-disable-sync-point-to-player)
  ;; Remember cursor position between sessions
 ;; (add-hook 'subed-mode-hook 'save-place-local-mode)
  ;; Break lines automatically while typing
 ;; (add-hook 'subed-mode-hook 'turn-on-auto-fill)
   ;; Break lines at 40 characters
  ;;(add-hook 'subed-mode-hook (lambda () (setq-local fill-column 40))))



(after! org
  (setq org-directory "~/Org"                     ; let's put files here
        org-list-allow-alphabetical t             ; have a. A. a) A) list bullets
        org-use-property-inheritance t            ; it's convenient to have properties inherited
        org-fold-catch-invisible-edits 'smart          ; try not to accidently do weird stuff in invisible regions
        org-log-done 'time                        ; having the time a item is done sounds convenient
        org-roam-directory "~/Org/roam/"))        ; same thing, for roam

;; org-agenda-config
(after! org-agenda
  (setq org-agenda-files (list "~/org/agenda.org"
                               "~/org/todo.org"))
  (setq org-agenda-window-setup 'current-window
        org-agenda-restore-windows-after-quit t
        org-agenda-show-all-dates nil
        org-agenda-time-in-grid t
        org-agenda-show-current-time-in-grid t
        org-agenda-start-on-weekday 1
        org-agenda-span 7
        org-agenda-tags-column  0
        org-agenda-block-separator nil
        org-agenda-category-icon-alist nil
        org-agenda-sticky t)
  (setq org-agenda-prefix-format
        '((agenda . "%i %?-12t%s")
          (todo .   "%i")
          (tags .   "%i")
          (search . "%i")))
  (setq org-agenda-sorting-strategy
        '((agenda deadline-down scheduled-down todo-state-up time-up
                  habit-down priority-down category-keep)
          (todo   priority-down category-keep)
          (tags   timestamp-up priority-down category-keep)
          (search category-keep))))


(after! org
  (remove-hook 'org-agenda-finalize-hook '+org-exclude-agenda-buffers-from-workspace-h)
  (remove-hook 'org-agenda-finalize-hook
               '+org-defer-mode-in-agenda-buffers-h))

(after! org
  (setq org-agenda-deadline-faces
        '((1.0 . error)
          (1.0 . org-warning)
          (0.5 . org-upcoming-deadline)
          (0.0 . org-upcoming-distant-deadline))))

(use-package! org-roam
  :after org)

(setq org-roam-v2-ack t)

(use-package! org-roam
  :after org
  :config
  (setq org-roam-v2-ack t)
  (setq org-roam-mode-sections
        (list #'org-roam-backlinks-insert-section
              #'org-roam-reflinks-insert-section
              #'org-roam-unlinked-references-insert-section))
  (org-roam-db-autosync-enable))

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-open-on-start nil)
  (setq org-roam-ui-browser-function #'xwidget-webkit-browse-url))

(use-package! websocket
  :after org-roam)

 (use-package! org-roam-ui
   :after org-roam
   :commands org-roam-ui-open
   :config
   (setq org-roam-ui-sync-theme t
         org-roam-ui-follow t
         org-roam-ui-update-on-save t
         org-roam-ui-open-on-start t))
 (after! org-roam
 (setq +org-roam-open-buffer-on-find-file nil))

(after! org-roam
    (setq org-roam-capture-templates
        `(("F" "French" plain "%?"
     :if-new
     (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
      "${title}\n#+filetags:French\n#+LATEX_CLASS:tufte-book\n\n ")
     :unnarrowed t)
        ("D" "Data Management" plain "%?"
     :if-new
     (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
      "${title}\n#+filetags:Data_Management \n#+LATEX_CLASS:tufte-book\n\n ")
     :unnarrowed t)
        ("C" "Computer Engineering" plain "%?"
     :if-new
     (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
      "${title}\n#+filetags:Computer_Engineering\n#+LATEX_CLASS:tufte-book \n\n ")
     :unnarrowed t)
        ("B" "Biology " plain "%?"
     :if-new
     (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
      "${title}\n#+filetags:Biology\n#+LATEX_CLASS:tufte-book\n\n ")
     :unnarrowed t))))

(when (display-graphic-p)
  (require 'all-the-icons))

(use-package! doct
  :defer t
  :commands (doct))

(defun org-capture-select-template-prettier (&optional keys)
  "Select a capture template, in a prettier way than default Lisp programs can force the template by setting KEYS to a string." (let ((org-capture-templates
         (or (org-contextualize-keys
              (org-capture-upgrade-templates org-capture-templates)
              org-capture-templates-contexts)
             '(("t" "Task" entry (file+headline "" "Tasks")
                "* TODO %?\n  %u\n  %a")))))
    (if keys
        (or (assoc keys org-capture-templates)
            (error "No capture template referred to by \"%s\" keys" keys))
      (org-mks org-capture-templates
               "Select a capture template\n━━━━━━━━━━━━━━━━━━━━━━━━━"
               "Template key: "
               `(("q" ,(concat (all-the-icons-octicon "stop" :face 'all-the-icons-red :v-adjust 0.01) "\tAbort")))))))
(advice-add 'org-capture-select-template :override #'org-capture-select-template-prettier)

(defun org-mks-pretty (table title &optional prompt specials)

  (save-window-excursion
    (let ((inhibit-quit t)
          (buffer (org-switch-to-buffer-other-window "*Org Select*"))
          (prompt (or prompt "Select: "))
          case-fold-search
          current)
      (unwind-protect
          (catch 'exit
            (while t
              (setq-local evil-normal-state-cursor (list nil))
              (erase-buffer)
              (insert title "\n\n")
              (let ((des-keys nil)
                    (allowed-keys '("\C-g"))
                    (tab-alternatives '("\s" "\t" "\r"))
                    (cursor-type nil))
                ;; Populate allowed keys and descriptions keys
                ;; available with CURRENT selector.
                (let ((re (format "\\`%s\\(.\\)\\'"
                                  (if current (regexp-quote current) "")))
                      (prefix (if current (concat current " ") "")))
                  (dolist (entry table)
                    (pcase entry
                      ;; Description.
                      (`(,(and key (pred (string-match re))) ,desc)
                       (let ((k (match-string 1 key)))
                         (push k des-keys)
                         ;; Keys ending in tab, space or RET are equivalent.
                         (if (member k tab-alternatives)
                             (push "\t" allowed-keys)
                           (push k allowed-keys))
                         (insert (propertize prefix 'face 'font-lock-comment-face) (propertize k 'face 'bold) (propertize "›" 'face 'font-lock-comment-face) "  " desc "…" "\n")))
                      ;; Usable entry.
                      (`(,(and key (pred (string-match re))) ,desc . ,_)
                       (let ((k (match-string 1 key)))
                         (insert (propertize prefix 'face 'font-lock-comment-face) (propertize k 'face 'bold) "   " desc "\n")
                         (push k allowed-keys)))
                      (_ nil))))
                ;; Insert special entries, if any.
                (when specials
                  (insert "─────────────────────────\n")
                  (pcase-dolist (`(,key ,description) specials)
                    (insert (format "%s   %s\n" (propertize key 'face '(bold all-the-icons-red)) description))
                    (push key allowed-keys)))
                ;; Display UI and let user select an entry or
                ;; a sub-level prefix.
                (goto-char (point-min))
                (unless (pos-visible-in-window-p (point-max))
                  (org-fit-window-to-buffer))
                (let ((pressed (org--mks-read-key allowed-keys prompt nil)))
                  (setq current (concat current pressed))
                  (cond
                   ((equal pressed "\C-g") (user-error "Abort"))
                   ((equal pressed "ESC") (user-error "Abort"))
                   ;; Selection is a prefix: open a new menu.
                   ((member pressed des-keys))
                   ;; Selection matches an association: return it.
                   ((let ((entry (assoc current table)))
                      (and entry (throw 'exit entry))))
                   ;; Selection matches a special entry: return the
                   ;; selection prefix.
                   ((assoc current specials) (throw 'exit current))
                   (t (error "No entry available")))))))
        (when buffer (kill-buffer buffer))))))
(advice-add 'org-mks :override #'org-mks-pretty)

(setf (alist-get 'height +org-capture-frame-parameters) 15)
;; (alist-get 'name +org-capture-frame-parameters) "❖ Capture") ;; ATM hardcoded in other places, so changing breaks stuff
(setq +org-capture-fn
      (lambda ()
        (interactive)
        (set-window-parameter nil 'mode-line-format 'none)
        (org-capture)))

(defun +doct-icon-declaration-to-icon (declaration)
  "Convert :icon declaration to icon"
  (let ((name (pop declaration))
        (set  (intern (concat "all-the-icons-" (plist-get declaration :set))))
        (face (intern (concat "all-the-icons-" (plist-get declaration :color))))
        (v-adjust (or (plist-get declaration :v-adjust) 0.01)))
    (apply set `(,name :face ,face :v-adjust ,v-adjust))))

(defun +doct-iconify-capture-templates (groups)
  "Add declaration's :icon to each template group in GROUPS."
  (let ((templates (doct-flatten-lists-in groups)))
    (setq doct-templates (mapcar (lambda (template)
                                   (when-let* ((props (nthcdr (if (= (length template) 4) 2 5) template))
                                               (spec (plist-get (plist-get props :doct) :icon)))
                                     (setf (nth 1 template) (concat (+doct-icon-declaration-to-icon spec)
                                                                    "\t"
                                                                    (nth 1 template))))
                                   template)
                                 templates))))

(setq doct-after-conversion-functions '(+doct-iconify-capture-templates))


;;(after! org-capture
 ;; (require 'noflet)
  ;;(setq org-capture-templates
   ;;     (doct `(("Todo" :keys "t"
   ;;              :icon ("home" :set "octicon" :color "cyan")
  ;;               :file "~/org/todo.org"
 ;;                :prepend t
      ;;           :headline "Inbox"
     ;;           :template ("* TODO %?"
    ;;                        "%i %a"))
    ;;            ("Agenda" :keys "a"
    ;;             :icon ("business" :set "material" :color "yellow")
    ;;             :file "~/org/agenda.org"
    ;;             :prepend t
    ;;             :headline "Inbox"
    ;;             :template ("* TODO %?"
    ;;                        "SCHEDULED: %^{Schedule:}t"
    ;;                        "DEADLINE: %^{Deadline:}t"
   ;;                         "%i %a"))
  ;;              ("Note" :keys "n"
  ;;               :icon ("sticky-note" :set "faicon" :color "yellow")
  ;;               :file "~/org/notes.org"
  ;;               :template ("* *?"
  ;;                          "%i %a"))
  ;;              ("Journal" :keys "j"
  ;;               :icon ("calendar" :set "faicon" :color "pink")
  ;;               :type plain
  ;;               :function (lambda ()
  ;;                           (org-journal-new-entry t)
  ;;                           (unless (eq org-journal-file-type 'daily)
 ;;                              (org-narrow-to-subtree))
 ;;                            (goto-char (point-max)))
 ;;                :template "** %(format-time-string org-journal-time-format)%^{Title}\n%i%?"
 ;;                :jump-to-captured t
 ;;                :immediate-finish t)
 ;;               ("Project" :keys "p"
 ;;                :icon ("repo" :set "octicon" :color "silver")
 ;;                :prepend t
 ;;                :type entry
 ;;                :headline "Inbox"
 ;;                :template ("* %{keyword} %?"
 ;;                           "%i"
 ;;                           "%a")
 ;;                :file ""
 ;;                :custom (:keyword "")
  ;;               :children (("Task" :keys "t"
 ;;                             :icon ("checklist" :set "octicon" :color "green")
;;                            :keyword "TODO"
;;                             :file +org-capture-project-todo-file)
;;                            ("Note" :keys "n"
;;                             :icon ("sticky-note" :set "faicon" :color "yellow")
;;                             :keyword "%U"
;;                             :file +org-capture-project-notes-file)))))))

;;(require 'noflet)
;;(defun timu-func-make-capture-frame ()
;;  "Create a new frame and run `org-capture'."
;;  (interactive)
;;  (make-frame '((name . "capture")
;;                (top . 300)
;;                (left . 700)
;;                (width . 80)
;;                (height . 25)))
;;  (select-frame-by-name "capture")
;;  (delete-other-windows)
;;  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
;;          (org-capture)))
;;(defadvice org-capture-finalize
;;    (after delete-capture-frame activate)
;;  "Advise capture-finalize to close the frame."
;;  (if (equal "capture" (frame-parameter nil 'name))
;;      (delete-frame)))
;;(defadvice org-capture-destroy
;;    (after delete-capture-frame activate)
;;  "Advise capture-destroy to close the frame."
;;  (if (equal "capture" (frame-parameter nil 'name))
;;      (delete-frame)))

;; org modern
(setq ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-fold-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…"

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "⭠ now ─────────────────────────────────────────────────")
(global-org-modern-mode)

(use-package svg-tag-mode
  :commands svg-tag-mode
  :config
  (defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")
  (defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")
  (defconst day-re "[A-Za-z]\\{3\\}")
  (defconst day-time-re (format "\\(%s\\)? ?\\(%s\\)?" day-re time-re))
  (defun svg-progress-percent (value)
    (svg-image (svg-lib-concat
                (svg-lib-progress-bar (/ (string-to-number value) 100.0)
                                  nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                (svg-lib-tag (concat value "%")
                             nil :stroke 0 :margin 0)) :ascent 'center))

  (defun svg-progress-count (value)
    (let* ((seq (mapcar #'string-to-number (split-string value "/")))
           (count (float (car seq)))
           (total (float (cadr seq))))
    (svg-image (svg-lib-concat
                (svg-lib-progress-bar (/ count total) nil
                                      :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                (svg-lib-tag value nil
                             :stroke 0 :margin 0)) :ascent 'center)))

  (setq svg-tag-tags
        `(
          ;; Org tags
          (":\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))
          (":\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))
          ;; Task priority
          ("\\[#[A-Z]\\]" . ( (lambda (tag)
                                (svg-tag-make tag :face 'org-priority
                                              :beg 2 :end -1 :margin 0))))

          ;; Progress
          ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)
                                              (svg-progress-percent (substring tag 1 -2)))))
          ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)
                                            (svg-progress-count (substring tag 1 -1)))))

          ;; TODO / DONE
          ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :face 'org-todo :inverse t :margin 0))))
          ("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'org-done :margin 0))))


          ;; Citation of the form [cite:@Knuth:1984]
          ("\\(\\[cite:@[A-Za-z]+:\\)" . ((lambda (tag)
                                            (svg-tag-make tag
                                                          :inverse t
                                                          :beg 7 :end -1
                                                          :crop-right t))))
          ("\\[cite:@[A-Za-z]+:\\([0-9]+\\]\\)" . ((lambda (tag)
                                                  (svg-tag-make tag
                                                                :end -1
                                                                :crop-left t))))


          ;; Active date (with or without day name, with or without time)
          (,(format "\\(<%s>\\)" date-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :end -1 :margin 0))))
          (,(format "\\(<%s \\)%s>" date-re day-time-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0))))
          (,(format "<%s \\(%s>\\)" date-re day-time-re) .
           ((lambda (tag)
              (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0))))

          ;; Inactive date  (with or without day name, with or without time)
           (,(format "\\(\\[%s\\]\\)" date-re) .
            ((lambda (tag)
               (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))
           (,(format "\\(\\[%s \\)%s\\]" date-re day-time-re) .
            ((lambda (tag)
               (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0 :face 'org-date))))
           (,(format "\\[%s \\(%s\\]\\)" date-re day-time-re) .
            ((lambda (tag)
               (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0 :face 'org-date)))))))

(after! org
(setq org-ellipsis " ▾ ")
  (appendq! +ligatures-extra-symbols
          `(:checkbox      "☐"
            :pending       "◼"
            :checkedbox    "☑"
            :list_property "∷"
            :em_dash       "—"
            :ellipses      "…"
            :arrow_right   "→"
            :arrow_left    "←"
            :title        " "
            :subtitle      "𝙩"
            :author        "𝘼"
            :date          "𝘿"
            :property      "⏻"
            :options       "⌥"
            :startup       ""
            :macro         "𝓜"
            :html_head     "🅷"
            :html          "🅗"
            :latex_class   "🄻"
            :latex_header  "🅻"
            :beamer_header "🅑"
            :latex         "🅛"
            :attr_latex    "🄛"
            :attr_html     "🄗"
            :attr_org      "⒪"
            :begin_quote   "❝"
            :end_quote     "❞"
            :caption       "☰"
            :header        "›"
            :results       "🠶"
            :begin_export  "⏩"
            :end_export    "⏪"
            :properties    "⏻"
            :end           "∎"
            :priority_a   ,(propertize "⚑" 'face 'all-the-icons-red)
            :priority_b   ,(propertize "⬆" 'face 'all-the-icons-orange)
            :priority_c   ,(propertize "■" 'face 'all-the-icons-yellow)
            :priority_d   ,(propertize "⬇" 'face 'all-the-icons-green)
            :priority_e   ,(propertize "❓" 'face 'all-the-icons-blue)
            :roam_tags nil
            :filetags nil))
(set-ligatures! 'org-mode
  :merge t
  :checkbox      "[ ]"
  :pending       "[-]"
  :checkedbox    "[X]"
  :list_property "::"
  :em_dash       "---"
  :ellipsis      "..."
  :arrow_right   "->"
  :arrow_left    "<-"
  :title         "#+title:"
  :subtitle      "#+subtitle:"
  :author        "#+author:"
  :date          "#+date:"
  :property      "#+property:"
  :options       "#+options:"
  :startup       "#+startup:"
  :macro         "#+macro:"
  :html_head     "#+html_head:"
  :html          "#+html:"
  :latex_class   "#+latex_class:"
  :latex_header  "#+latex_header:"
  :beamer_header "#+beamer_header:"
  :latex         "#+latex:"
  :attr_latex    "#+attr_latex:"
  :attr_html     "#+attr_html:"
  :attr_org      "#+attr_org:"
  :begin_quote   "#+begin_quote"
  :end_quote     "#+end_quote"
  :caption       "#+caption:"
  :header        "#+header:"
  :begin_export  "#+begin_export"
  :end_export    "#+end_export"
  :results       "#+RESULTS:"
  :property      ":PROPERTIES:"
  :end           ":END:"
  :priority_a    "[#A]"
  :priority_b    "[#B]"
  :priority_c    "[#C]"
  :priority_d    "[#D]"
  :priority_e    "[#E]"
  :roam_tags     "#+roam_tags:"
  :filetags      "#+filetags:")
(plist-put +ligatures-extra-symbols :name "⁍")
)

(custom-theme-set-faces
     'user
     `(org-level-4 ((t (:height 0.9))))
     `(org-level-3 ((t (:height 1.15 :inherit nano-popout))))
     `(org-level-2 ((t (:height 1.3 :inherit nano-popout))))
     `(org-level-1 ((t (:height 1.45 :inherit nano-salient))))
     `(org-document-title ((t (:height 1.7 :underline t :inherit nano-salient)))))

;;(set-face-attribute 'default nil :font "IBM 3270" :height 160 :weight normal)
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 12))
(set-face-attribute 'fixed-pitch nil :family "IBM 3270" :height 160)
(set-face-attribute 'variable-pitch nil :family "Ogg" :height 160)
(add-hook 'org-mode-hook 'variable-pitch-mode)

(after! org
    (setq org-src-fontify-natively t
    org-fontify-whole-heading-line t
    org-pretty-entities t
    org-ellipsis "  " ;; folding symbol
    org-hide-emphasis-markers t
    org-agenda-block-separator ""
    org-fontify-done-headline t
    prot/scroll-center-cursor-mode t
    org-fontify-quote-and-verse-blocks t
    org-startup-with-inline-images t
    org-startup-indented t))

    (lambda () (progn
      (setq left-margin-width 2)
      (setq right-margin-width 2)
      (set-window-buffer nil (current-buffer))))
(setq header-line-format " ")
(add-hook 'org-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("^-\\{5,\\}"  0 '(:foreground "purple" :weight bold))))))

(require 'ink)

;; (use-package! olivetti
;;   :after org
;;   ;:hook (olivetti-mode . double-header-line-mode)
;;   :config
;;     (setq olivetti-min-body-width 50
;;           olivetti-body-width 130
;;           olivetti-style 'fancy ; fantastic new layout
;;           olivetti-margin-width 12)
;;     (add-hook! 'olivetti-mode-hook (window-divider-mode -1))
;;     (add-hook! 'olivetti-mode-hook (set-face-attribute 'window-divider nil :foreground (face-background 'fringe) :background (face-background 'fringe)))
;;     (add-hook! 'olivetti-mode-hook (set-face-attribute 'vertical-border nil :foreground (face-background 'fringe) :background (face-background 'fringe)))
;;     )

;; (with-eval-after-load 'ox
;;   (require 'ox-hugo))

;; Tufte Latex Classes

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
'("tuftebook"
"\\documentclass{tufte-book}\n
\\usepackage{color}
\\usepackage{amssymb}
\\usepackage{gensymb}
\\usepackage{nicefrac}
\\usepackage{units}"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
 ;; tufte-handout class for writing classy handouts and papers
(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
'("tuftehandout" "\\documentclass{tufte-handout}
\\usepackage{color}
\\usepackage{amssymb}
\\usepackage{amsmath}
\\usepackage{gensymb}
\\usepackage{nicefrac}
\\usepackage{units}"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
                     '("rbt-mathnotes-formula-sheet"
                     " \\documentclass[]{rbt-mathnotes-formula-sheet}")))

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
                     '("rbt-mathnotes"
                     " \\documentclass[]{rbt-mathnotes}")))

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
                     '("rbt-mathnotes-hw"
                     " \\documentclass[]{rbt-mathnotes-hw}")))

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
'("lectures"
"\\documentclass[english]{lectures}\n"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
'("math_lectures"
"\\documentclass[]{report}\n"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
(with-eval-after-load 'org
  (plist-put org-format-latex-options :background 'default))

(use-package! org-noter
  :after (:any org pdf-view)
  :config
  (setq
   ;; The WM can handle splits
   ;;org-noter-notes-window-location 'other-frame
   ;; Please stop opening frames
   ;;org-noter-always-create-frame nil
   ;; I want to see the whole file
   org-noter-hide-other nil
   )
  )

;; CALC mode
(map! :map calc-mode-map
      :after calc
      :localleader
      :desc "Embedded calc (toggle)" "e" #'calc-embedded)
(map! :map org-mode-map
      :after org
      :localleader
      :desc "Embedded calc (toggle)" "E" #'calc-embedded)
(map! :map latex-mode-map
      :after latex
      :localleader
      :desc "Embedded calc (toggle)" "e" #'calc-embedded)
(defvar calc-embedded-trail-window nil)
(defvar calc-embedded-calculator-window nil)

(defadvice! calc-embedded-with-side-pannel (&rest _)
  :after #'calc-do-embedded
  (when calc-embedded-trail-window
    (ignore-errors
      (delete-window calc-embedded-trail-window))
    (setq calc-embedded-trail-window nil))
  (when calc-embedded-calculator-window
    (ignore-errors
      (delete-window calc-embedded-calculator-window))
    (setq calc-embedded-calculator-window nil))
  (when (and calc-embedded-info
             (> (* (window-width) (window-height)) 1200))
    (let ((main-window (selected-window))
          (vertical-p (> (window-width) 80)))
      (select-window
       (setq calc-embedded-trail-window
             (if vertical-p
                 (split-window-horizontally (- (max 30 (/ (window-width) 3))))
               (split-window-vertically (- (max 8 (/ (window-height) 4)))))))
      (switch-to-buffer "*Calc Trail*")
      (select-window
       (setq calc-embedded-calculator-window
             (if vertical-p
                 (split-window-vertically -6)
               (split-window-horizontally (- (/ (window-width) 2))))))
      (switch-to-buffer "*Calculator*")
      (select-window main-window))))

(require 'gpt)
(setq gpt-openai-key "*")
