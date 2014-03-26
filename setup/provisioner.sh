# system upgrades
sudo apt-get update
sudo apt-get install -y openjdk-7-jdk git ant python-pip g++ make

# ccm
sudo pip install cql PyYAML
git clone https://github.com/pcmanus/ccm.git
cd ccm; sudo ./setup.py install; cd ..

# cassandra source
wget -c https://archive.apache.org/dist/cassandra/2.0.6/apache-cassandra-2.0.6-bin.tar.gz
tar xvfz apache-cassandra-2.0.6-bin.tar.gz

# zeromq
wget -c http://download.zeromq.org/zeromq-4.0.3.tar.gz
tar xzf zeromq-4.0.3.tar.gz
cd zeromq-4.0.3
./configure && make && make install
ldconfig
cd ..

# node.js 
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

# coffee-script
sudo npm install -g coffee-script
npm install zmq --unsafe-perm
npm install node-cassandra-cql --unsafe-perm

# Set up environment variables
sudo sh -c "cat > /etc/profile.d/reactivegrid.sh" <<'EOF'
export CASSANDRA_HOME=~/apache-cassandra-2.0.6
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
EOF
source /etc/profile.d/reactivegrid.sh

cp -r /vagrant/server-example /home/vagrant
