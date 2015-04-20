(defvar site-head
  "<link rel='stylesheet' href='/css/style.css' type='text/css' />"
  )

(defvar site-preamble
  "<div id='header'>Dengshuan's Notes</div>
   <div id='navigation'>
       <ul>
           <li><a href='/'>Home</a></li>
           <li><a href='https://github.com/dengshuan/notes'>Source</a></li>
           <li><a href='/about.html'>About</a></li>
       </ul>
   </div>"
  )

(defvar site-postamble
  "<div id='footer'>&copy;Copyright by Dengshuan 2015</div>"
  )

(setq org-image-actual-width '(300))

(setq org-publish-project-alist
      `(("org"
	 :base-directory "~/notes/"
	 :base-extension "org"
	 :publishing-directory "~/public_html/"
	 :publishing-function org-html-publish-to-html
	 :exclude "drafts\\|private\\|todo\\|README" ;; ignore drafts, private, todo
	 :headline-levels 4
	 :makeindex nil
	 :with-tags t
	 :recursive t
	 :auto-sitemap t
	 :sitemap-title "List of My Notes"
	 :sitemap-sort-files anti-chronologically
	 :sitemap-file-entry-format "%d [%t]"
	 :section-numbers nil
	 :with-toc nil
	 :htmlized-source t
	 :html-preamble ,site-preamble
	 :html-postamble ,site-postamble
	 :html-head ,site-head
	 )

	("images"
	 :base-directory "~/notes/images/"
	 :base-extension "jpg\\|gif\\|png"
	 :publishing-directory "~/public_html/images/"
	 :publishing-function org-publish-attachment)

	("css"
	 :base-directory "~/notes/css/"
	 :base-extension "css"
	 :publishing-directory "~/public_html/css/"
	 :publishing-function org-publish-attachment)

	("code"
	 :base-directory "~/notes/code/"
	 :base-extension "el\\|py\\|rs\\|c\\|conf"
	 :publishing-directory "~/public_html/code/"
	 :publishing-function org-publish-attachment)

	("notes" :components ("org" "images" "css" "code"))))


;; Ref: http://jerrypeng.me/2013/10/remove-org-html-useless-spaces/
(defadvice org-html-paragraph (before org-html-paragraph-advice
                                      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
  (let* ((origin-contents (ad-get-arg 1))
         (fix-regexp "[[:multibyte:]]")
         (fixed-contents
          (replace-regexp-in-string
           (concat
            "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))
    (ad-set-arg 1 fixed-contents)))
