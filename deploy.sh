set -e
rsync -r --delete-after -e "ssh -i /tmp/deploy-rsa" --include '*.html' --include '*.css' --include '*.png' . deploy@getfambit.com:/usr/share/nginx/www.getfambit.com
ssh -i /tmp/deploy-rsa deploy@getfambit.com "chgrp -R http /usr/share/nginx/www.getfambit.com"
