echo 'export PATH=/rbenv/plugins/ruby-build/bin:/rbenv/bin:${PATH}' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# install rbenv
rbenv install 2.6.5
rbenv rehash
rbenv global 2.6.5
gem install bundler
rbenv rehash

# install dgidb
cd /home/dgidb/dgidb
bundle install
rbenv rehash
rake dgidb:load_local