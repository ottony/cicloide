def install_dependecies
 #Gosu's dependencies for both C++ and Ruby
 sh "sudo apt-get install build-essential freeglut3-dev libfreeimage-dev libgl1-mesa-dev libopenal-dev libpango1.0-dev libsdl-ttf2.0-dev libsndfile-dev libxinerama-dev"
end

def install_bundle
 sh "gem install bundler"
end

def call_blunder
  sh "bundle install"
end

task :default do
  install_dependecies
  install_bundle
  call_blunder
end

