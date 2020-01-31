
apt-get install apache2
a2enmod rewrite filter deflate headers expires proxy_http.load
apache2ctl restart
wget http://repo.mysql.com/mysql-apt-config_0.8.14-1_all.deb
apt install ./mysql-apt-config_0.8.14-1_all.deb 
apt update
apt-get install mysql-server mysql-client
password: ts
mysql -u root -p
mysql>
exit
apt-get install php php-mysql libapache2-mod-php php-curl php-json
apt-get install screen
apt-get install openjdk-11-jre
cd
wget http://mirror.downloadvn.com/apache//activemq/5.15.11/apache-activemq-5.15.11-bin.tar.gz
tar xzf apache-activemq-5.15.11-bin.tar.gz
mv apache-activemq-5.15.11 /opt
ln -sf /opt/apache-activemq-5.15.11/ /opt/activemq
adduser -system activemq
sed -i 's#activemq:/bin/false#activemq:/bin/bash#g' /etc/passwd
chown -R activemq: /opt/apache-activemq-5.15.11/
ln -sf /opt/activemq/bin/activemq /etc/init.d/
son added: printf '%s\n' '#!/bin/bash' 'exit 0' | sudo tee -a /etc/rc.local
sed -i 's#exit 0##g' /etc/rc.local
sh -c 'echo "/bin/sh /usr/bin/activemq start" >> /etc/rc.local'
/etc/init.d/activemq create /etc/default/activemq
chown root:nogroup /etc/default/activemq
chmod 600 /etc/default/activemq
sed -i 's/Context createConnector='false'/Context createConnector='true'/g' /etc/default/activemq/conf/activemq.xml
ln -s /etc/init.d/activemq /usr/bin/activemq
activemq start
rm apache-activemq-5.15.11-bin.tar.gz
apt-get install redis-server
sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
service redis-server restart
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs
npm install grunt
        npm WARN saveError ENOENT: no such file or directory, open '/root/Workspace/package.json'
        npm WARN enoent ENOENT: no such file or directory, open '/root/Workspace/package.json'
npm install -g grunt-cli
echo "screen -d -m -S 'node' node \/home\/matecat\/cattool\/nodejs\/server.js" >> /etc/rc.local
echo "short_open_tag = On" >> /etc/php/7.3/cli/php.ini
echo "memory_limit = 1024M" >> /etc/php/7.3/cli/php.ini
apache2ctl restart
adduser --disabled-password --gecos "" matecat
apt-get install git
su - matecat
git clone https://github.com/matecat/MateCat.git cattool
cd ~/cattool/lib/Model
mysql -u root -p < matecat.sql
    enter pw ts
mysql -u root -p
delete from mysql.user where user = 'matecat' and host = '%';
grant all privileges on matecat.* to 'matecat'@'localhost' identified by 'matecat01';
FLUSH PRIVILEGES;
exit
cd ~/cattool/INSTALL
cp matecat-vhost.conf.sample matecat-vhost.conf
sed -i "s/@@@path@@@/\/home\/matecat\/cattool/g" matecat-vhost.conf
Install the virtualhost:
exit
mv /home/matecat/cattool/INSTALL/matecat-vhost.conf /etc/apache2/sites-available
a2ensite matecat-vhost.conf
apache2ctl restart

son: cd /home/matecat/cattool
php -r "readfile('https://getcomposer.org/installer');" | php
    or: 
        download the file with firefox: https://getcomposer.org/installer
        php installer        
apt install php-xml
apt install php-mbstring
php composer.phar --no-dev install
    Package phpoffice/phpexcel is abandoned, you should avoid using it. Use phpoffice/phpspreadsheet instead.
su - matecat
cd ~/cattool/inc
cp config.ini.sample config.ini
cp task_manager_config.ini.sample task_manager_config.ini
sed -i "s/\/home\/matecat\/storage/\/home\/matecat\/cattool\/storage/g" config.ini
cd ~/cattool/support_scripts/grunt
npm install
grunt deploy
cd ~/cattool/nodejs
cp config.ini.sample config.ini
npm install
cd ~/cattool/daemons
echo '25' > .num_processes
exit
/bin/bash /home/matecat/cattool/daemons/restartAnalysis.sh
sh -c 'echo "/bin/sh /home/matecat/cattool/daemons/restartAnalysis.sh" >> /etc/rc.local'
sh -c 'echo "exit 0" >> /etc/rc.local'
chown -R www-data /home/matecat/cattool/storage/
screen -d -m -S 'node' node /home/matecat/cattool/nodejs/server.js



Enabling Google+ login
Warning: this feature is optional, but without it MateCat can only be used in anonymous mode
MateCat uses Google+ login as authentication mechanism: you can keep track of your projects in a private panel under “Manage” section by logging in with any valid Google account. Note that this is not limited to GMail: any valid email address can be used, upon registration as a Google account.

In order to enable it, you need a Google account
If you don’t have a client id and client secret, please visit Google Developers Console and follow these instructions:

click on “Create Project“, specify a project name, a project ID and check “I agree with Google ToS” checkbox; it may take a little to create your project
click on your newly created project
select “APIs & auth” on left sidebar
scroll down the list to “Google+ API” and switch the status of ON
go back to left sidebar and, under “APIs & auth” menu, select “Credentials“
click on “Create new client ID” buttonu
under APPLICATION TYPE, select “Web application” option
under AUTHORIZED JAVASCRIPT ORIGINS, insert the domain MateCat will be accessed from
under REDIRECT URIs, insert “http://<domain>/oauth/response” or “http://localhost/oauth/response”, where <domain> is the domain that you specified in the previous step
click on “Create client ID“. Take note of the “Client ID” and a “Client secret” you just obtained
go back to left sidebar and, under “APIs & auth” menu, select “Consent screen“
under PRODUCT NAME, choose a meaningful name (for example, MateCat)
scroll down the page and click “Save“
Finally, edit the file ~/cattool/inc/oauth_config.ini.sample, replacing the default parameters with those obtained in the previous step:
OAUTH_CLIENT_ID with your client ID
OAUTH_CLIENT_SECRET with your client secret
OAUTH_CLIENT_APP_NAME with your custom app name,or leave MateCat
save the file as oauth_config.ini
change permissions for the ini file with:
chmod 400  ~/cattool/inc/oauth_config.ini
chown www-data:www-data ~/cattool/inc/oauth_config.ini

Go to top

Translating other formats than XLIFF (optional)
MateCat directly supports XLIFF files only, but using an additional component it can support almost any file format. The additional component you need is MateCat Filters.

The easiest way to enable MateCat Filters is using our hosted API on Mashape. It’s very simple:

Go to the Filters page on Mashape and choose your plan. You can begin using the Basic plan, with 250 free API calls per month.
Click the subscribe button of your preferred plan and complete the subscription process.
When successfully subscribed, use the Applications menu on top of the page and click on the application you are using (for new accounts it’s “Default Application”).
In the application page click on the “Get the keys” button on the right, near the top, then copy your key.
Back to your MateCat install folder, open inc/config.ini, look for the FILTERS_MASHAPE_KEY parameter in the [production] section, and paste your key:
[production]
DB_SERVER = "localhost"
DB_DATABASE = "matecat"

; ...

; Filters Configuration
FILTERS_ADDRESS = https://translated-matecat-filters-v1.p.mashape.com
FILTERS_MASHAPE_KEY = B3uowdUhVFmshBNV5VVYPUpSccx7p1PcSsrjsnT7f54ozqiCgz
Simple, isn’t it? Just add a working FILTERS_MASHAPE_KEY and you are done. You can then load any file you want in MateCat.

The steps above are the easiest way to attach Filters to MateCat, but if you want you can attach your personal instance of Filters too.

MateCat Filters has its own open-source repository. Read the wiki in the repo to learn how to build your local instance.
To make MateCat talk with your Filters instance simply edit the FILTERS_ADDRESS parameter in inc/config.ini, for example:

FILTERS_ADDRESS = http://localhost:8732
In this case you can ignore the FILTERS_MASHAPE_KEY parameter, it has no effect for instances running outside of Mashape.


That’s all. Now type http://localhost in Chrome or Safari and enjoy your fresh install.
