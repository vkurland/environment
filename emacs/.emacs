

(set-face-background 'default "black") ; frame background
(set-face-foreground 'default "green") ; normal text
(set-face-foreground 'cursor  "black")
(set-face-background 'cursor  "yellow")

(setq mac-allow-anti-aliasing nil)  ;; turn off anti-aliasing

;; this makes emacs use Command key as Meta on Mac OS X
;;
(setq mac-command-modifier 'meta)

;; (setq my-font "-apple-monaco-medium-r-normal--14-90-75-75-m-90-mac-roman")
;; (set-face-font 'default my-font)

(defun define_frame_attr (name value) (if (assq name default-frame-alist)
    (setcdr (assq name default-frame-alist) value)
  (setq default-frame-alist
	(cons (cons name value)
	      default-frame-alist)
	)
  ))

;; Window shifting. C-x-o lets us go forward a window (or several).
;; This one lets us go back one or more windows. From Glickstein.
(defun other-window-backward (&optional n)
  "Select previous Nth window."
    (interactive "P")
      (other-window (- (prefix-numeric-value n))))

;; Count words in region
(defun count-words (&optional begin end)
  "count words between BEGIN and END (region); if no region defined, count words in buffer"
  (interactive "r")
  (let ((b (if mark-active begin (point-min)))
      (e (if mark-active end (point-max))))
    (message "Word count: %s" (how-many "\\w+" b e))))

;; (define_frame_attr 'font my-font)
;; (define_frame_attr 'height 40)

(global-set-key [mouse-3] 'msb)
(global-set-key [mouse-2] 'null)


;; ---Paren stuff ---

;; Enable hightlighting of matching bracket
(show-paren-mode t)

;; Jumping to matching bracket
;; (global-set-key '[M-right] 'forward-list)
;; (global-set-key '[M-left]  'backward-list)

(cd "~/")

(setq vc-cvs-stay-local nil)

;; --- General ---

(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
;; (standard-display-european t)
(setq transient-mark-mode 1)
(setq scroll-step 1)
(setq compile-command "make")
;(autoload 'cyrillic-mode "cyrillic" () t)
(setq line-number-mode     1)
(delete-selection-mode t)

(global-set-key [home] 'beginning-of-line)
(global-set-key [end]  'end-of-line)

(global-set-key "\M-?"   'help-command)
(global-set-key "\C-h"   'delete-backward-char)
(global-set-key [delete] 'delete-char )
(global-set-key [kp-delete] 'delete-char )

(global-set-key "\C-x\C-n" 'other-window)
(global-set-key "\C-x\C-p" 'other-window-backward)

(global-set-key [M-right] 'other-window)
(global-set-key [M-left]  'other-window-backward)

(global-set-key [f9] 'compile)
(global-set-key "\M-b" 'ibuffer)
(global-set-key "\M-s" 'save-buffer)

(global-set-key "\M-[5C" 'forward-word)      ; Ctrl+right   => forward word
(global-set-key "\M-[5D" 'backward-word)     ; Ctrl+left    => backward word



(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(global-font-lock-mode t)
 '(ibuffer-display-summary t)
 '(ibuffer-formats (quote ((mark modified read-only " " (name 32 32 :left :elide) " " (size 9 -1 :right) " " (mode 16 16 :right :elide) " " filename-and-process) (mark " " (name 16 -1) " " filename))))

 '(ibuffer-saved-filter-groups
   (quote 
    (

     ("fwb3"
      ("fwb_build"
       (or (filename . "build/modules/.*")
           (filename . "build/tools/.*")
           (filename . "build/aws/.*")
           (filename . "build/vmware/.*")))
      ("fwb-docs"
       (filename . "fwbuilder/docs/.*"))
      ("fwb-web" (filename . "fwbuilder/web/.*"))
      ("fwbuilder_configlets" (or (filename . "source/fwbuilder/src/res/configlets/.*")))
      ("fwbuilder_platform" (or (filename . "source/fwbuilder/src/res/platform/.*")))
      ("fwbuilder_os" (or (filename . "source/fwbuilder/src/res/os/.*")))
      ("libfwbuilder" (or (filename . "source/fwbuilder/src/libfwbuilder.*")))
      ("fwbuilder" (or (filename . "source/fwbuilder/.*")))
      ("fwb-lm" (or (filename . "source/fwb-lm/.*"))))



     ("fortress"
      ("fortress_configlets" (or (filename . "source/fortress/src/res/configlets/.*")))
      ("fortress_platform" (or (filename . "source/fortress/src/res/platform/.*")))
      ("fortress_os" (or (filename . "source/fortress/src/res/os/.*")))
      ("fortress_libfwbuilder" (or (filename . "source/fortress/src/libfwbuilder.*")))
      ("fortress" (or (filename . "source/fortress/.*")))
      ("fwb-lm" (or (filename . "source/fwb-lm/.*"))))

     ("esm"
      ("doc" (or (filename . "esm/doc/")))

      ("wfe/commands" (or (filename . "esm/wfe/management/commands/.*.py")))
      ("wfe/tests" (or (filename . "esm/wfe/tests/")))
      ("wfe/models" (or (filename . "esm/wfe/models/")))

      ("imo/commands" (or (filename . "esm/imo/management/commands/.*.py")))
      ("imo/tests" (or (filename . "esm/imo/tests/")))
      ("imo/models" (or (filename . "esm/imo/.*.py")))

      ("readconfig/tests" (or (filename . "esm/readconfig/tests/")))
      ("readconfig" (or (filename . "esm/readconfig/")))

      ("other" (or (filename . "esm/.*"))))

     ("esm_compiler"
      ("doc" (or (filename . "esm/doc/")))
      ("imo/models" (or (filename . "esm/imo/.*.py")))
      ("commands" (or (filename . "esm/esm_compiler/management/commands/")))
      ("asa" (or (filename . "esm/esm_compiler/asa/")))
      ("f5" (or (filename . "esm/esm_compiler/f5/")))
      ("iosacl" (or (filename . "esm/esm_compiler/iosacl/")))
      ("iptables" (or (filename . "esm/esm_compiler/iptables/")))
      ("srx" (or (filename . "esm/esm_compiler/srx/")))
      ("rp" (or (filename . "esm/esm_compiler/rp/")))
      ("templates" (or (filename . "esm/esm_compiler/templates/")))
      ("tests" (or (filename . "esm/esm_compiler/tests/")))
      ("writers" (or (filename . "esm/esm_compiler/writers/")))
      ("esm_compiler" (or (filename . "esm/esm_compiler/")))
      ("platform_data" (or (filename . "esm/platform_data/")))
      ("readconfig/tests" (or (filename . "esm/readconfig/tests/")))
      ("readconfig" (or (filename . "esm/readconfig/"))))

     ("config_generators"
      ("doc" (or (filename . "esm/doc/")))
      ("commands" (or (filename . "esm/config_generators/management/commands/")))
      ("templates" (or (filename . "esm/config_generators/templates/")))
      ("tests" (or (filename . "esm/config_generators/tests/")))
      ("config_generators" (or (filename . "esm/config_generators/"))))

     ("nclang"
      ("doc" (or (filename . "esm/doc/")))
      ("commands" (or (filename . "esm/readconfig/management/commands/")))
      ("readconfig/tests" (or (filename . "esm/readconfig/tests/")))
      ("readconfig" (or (filename . "esm/readconfig/"))))


     ("simple" ("autoconf" (or (mode . autoconf-mode))) ("shell" (or (mode . sh-mode) (mode . csh-mode))) ("python" (or (mode . python-mode))) ("qt-pro" (or (filename . ".pro"))) ("c/c++" (or (mode . c-mode) (mode . c++-mode))) ("makefile" (or (mode . makefile-mode))) ("xml" (or (mode . xml-mode) (mode . sgml-mode))) ("html" (or (mode . html-mode))) ("css" (or (mode . css-mode))) ("js" (or (mode . java-mode))) ("diff" (or (mode . diff-mode)))))))

 '(ibuffer-saved-filters (quote ("gnus" ((or (mode . message-mode) (mode . mail-mode) (mode . gnus-group-mode) (mode . gnus-summary-mode) (mode . gnus-article-mode))))))
 '(paren-match-face (quote paren-face-match-light))
 '(paren-sexp-mode t)
 '(rst-level-face-base-light 50)
 '(safe-local-variable-values (quote ((sgml-omittag) (sgml-shorttag) (sgml-namecase-general . t) (sgml-general-insert-case . lower) (sgml-minimize-attributes) (sgml-always-quote-attributes . t) (sgml-indent-step . 2) (sgml-indent-data . t) (sgml-parent-document) (sgml-exposed-tags) (sgml-local-catalogs) (sgml-local-ecat-files))))
 '(save-place t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(show-paren-style (quote expression))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(user-mail-address "vadim@netcitadel.com"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
 '(paren-face-match-light ((t (:background "navyblue"))))
 '(region ((t (:background "ns_selection_color" :foreground "black"))))
 '(show-paren-match ((((class color) (background dark)) (:background "#333333")))))

'(rst-level-face-base-color "grey")
'(rst-level-face-base-light 30)


(if (fboundp 'paren-deactivate) (paren-deactivate))

;; --- C style ---

(defun my-c-setup ()
"C mode setup"
;  (my-on-fontlock)
  (define-key c-mode-map "\C-m" 'newline-and-indent)
  (define-key c-mode-map "\e\C-h" 'backward-kill-word)
  (c-add-style "Crocodile"
               '(
                 (c-basic-offset . 4)
                 (c-comment-only-line-offset . 0)
                 (c-offsets-alist .
                                  ((statement-block-intro . +)
                                   (arglist-intro         . +)
                                   (arglist-cont          . 0)
                                   (arglist-close         . 0)
                                   (knr-argdecl-intro     . +)
                                   (substatement-open     . 0)
                                   (label                 . -)
                                   (statement-cont        . +)
                                   (statement-case-open   . 0)
                                   (access-label          . 0)
                                   (inline-open           . 0)
                                   ))))
  (c-set-style "Crocodile")
  )

(add-hook 'c-mode-hook    'my-c-setup)
(add-hook 'c++-mode-hook  'my-c-setup)

;; --- Python style ---

(defun my-py-setup ()
"Python mode setup"
  (define-key py-mode-map "\C-m" 'newline-and-indent)
  (setq-default py-indent-offset 2)
  )

(add-hook 'py-mode-hook   'my-py-setup)


(put 'narrow-to-region 'disabled nil)

;; --- switching between buffers

(defun next-frame-or-buffer (&optional frame)
  "Move to next buffer.
With optional interactive prefix arg `frame', move to next frame instead."
  (interactive "P")
  (cond
   (frame
    (other-frame 1))
   (t
    (bury-buffer))))


(defun previous-frame-or-buffer (&optional frame)
  "Move to previous buffer.
With optional interactive prefix arg `frame', move to previous frame instead."
  (interactive "P")
  (cond
   (frame
    (other-frame -1))
   (t
    (let ((l
           (remove-if
            #'(lambda (b)
                (string-equal (substring
                               (buffer-name b)
                               0 1) " "))
            (buffer-list))))
      (switch-to-buffer (nth (1- (length l))
                             l))))))

;; --- IDO
(setq ido-confirm-unique-completion t)
(setq ido-default-buffer-method 'samewindow)
;; (setq ido-use-filename-at-point t)
(ido-mode t)
(ido-everywhere t)

;;(set-face-background 'ido-first-match "white")
;;(set-face-foreground 'ido-subdir "blue1")

(icomplete-mode 1)

;; --- TRAMP

(require 'tramp)
(setq tramp-default-method "scp")

;; ;;(setq tramp-syntax 'url)
;; (require 'tramp)
;; ;;(setq tramp-default-method "scp")
;; (setq vc-handled-backends nil)

;; (defadvice tramp-handle-write-region
;;   (after tramp-write-beep-advice activate)
;;   " make tramp beep after writing a file."
;;   (interactive)
;;   (beep))
          
;; (defadvice tramp-handle-do-copy-or-rename-file
;;   (after tramp-copy-beep-advice activate)
;;   " make tramp beep after copying a file."
;;   (interactive)
;;   (beep))
          
;; (defadvice tramp-handle-insert-file-contents
;;   (after tramp-copy-beep-advice activate)
;;   " make tramp beep after copying a file."
;;   (interactive)
;;   (beep))

;; (split-window-horizontally)
;; (split-window-horizontally)
;; (balance-windows)


(put 'downcase-region 'disabled nil)

;; Open NCLang .nc files in python-mode
(setq auto-mode-alist (cons '("\\.nc$" . python-mode) auto-mode-alist))

;; these do not seem to work just yet
(setq magic-mode-alist (cons '("\s*=\s*Device(" . python-mode) magic-mode-alist))
(setq magic-mode-alist (cons '("tcp([^)]*);"    . python-mode) magic-mode-alist))
(setq magic-mode-alist (cons '("udp([^)]*);"    . python-mode) magic-mode-alist))
(setq magic-mode-alist (cons '("icmp([^)]*);"   . python-mode) magic-mode-alist))
(setq magic-mode-alist (cons '("ip([^)]*);"     . python-mode) magic-mode-alist))

;; an attempt to add support for django templates
(autoload 'django-html-mumamo-mode "~/.emacs.d/nxhtml/autostart.el")
(setq auto-mode-alist
      (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("templates/.*/.*$" . django-html-mumamo-mode)) auto-mode-alist))
(setq mumamo-background-colors nil) 
(add-to-list 'auto-mode-alist '("templates/.*/.*$" . django-html-mumamo-mode))

