This is my [notes](http://dengshuan.me), all written in Emacs.

~~~~~~~~~~~~~~~~~~~
Configuration files
~~~~~~~~~~~~~~~~~~~

+ [setup.el](code/setup.el)
+ [nginx.conf](code/nginx.conf)
+ [post-receive](code/post-receive)



~~~~~~~~~~~~~~~~
Configure Server
~~~~~~~~~~~~~~~~

1. Add `server` section in [nginx.conf](code/nginx.conf) to */etc/nginx/nginx.conf* `http` section
2. Add `127.0.0.1 blog` to */etc/hosts*
3. Restart nginx server
4. Create folder *~/notes* and *~/notes.git*, and make sure Home folder *~/* have executable permission which means can enter
5. Link *~/notes* to */srv/http/* by `sudo ln -s /home/your-username/notes /srv/http/`
6. Run `git init --bare` in *~/notes.git/*
7. Copy [post-receive](code/post-receive) to *~/notes.git/hooks/* and make it executable by `chmod +x ~/notes.git/hooks/post-receive`



~~~~~~~~~
Work flow
~~~~~~~~~

1. Write draft note in org format within *drafts* folder
2. Move completed draft note from root folder or sub-folder: *life*,*misc*,*techs*,*trans*
3. Run `M-x org-publish-project RET notes RET`
4. Push rencent generated html in *~/public_html* to VPS
5. Push org files to GitHub (Optional)
