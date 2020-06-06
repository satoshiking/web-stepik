sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
#sudo ln -s /home/box/etc/hello.py /etc/gunicorn.d/hello.py
#sudo /etc/init.d/gunicorn restart
sudo /etc/init.d/gunicorn stop
sudo gunicorn -D -b "0.0.0.0:8080" /home/box/web/hello:app
#sudo /etc/init.d/mysql start


sudo apt-get update
sudo apt-get install -y python3.5
sudo apt-get install -y python3.5-dev
sudo unlink /usr/bin/python3
sudo ln -s /usr/bin/python3.5 /usr/bin/python3


cd /home/box
virtualenv -p python3 venv
source venv/bin/activate
pip install --upgrade pip
pip install django==2.1
pip install gunicorn
cd /home/box/web/ask
gunicorn -D --bind=0.0.0.0:8000 --workers=2 --timeout=15 --log-level=debug ask.wsgi:application

