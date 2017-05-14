set -e
ls -al $TRAVIS_BUILD_DIR
rsync -r --delete -e "ssh -i /tmp/deploy-rsa" --include '*.html' --include '*.css' --include '*.png' --exclude '*' $TRAVIS_BUILD_DIR/* deploy@getfambit.com:/usr/share/nginx/www.getfambit.com
ssh -i /tmp/deploy-rsa deploy@getfambit.com "chgrp -R http /usr/share/nginx/www.getfambit.com && chmod -R 750 -R /usr/share/nginx/www.getfambit.com"
