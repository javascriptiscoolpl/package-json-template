if [ ! -d "./node_modules" ]; then
  npm install;
  cat ./ignore.template > ./.gitignore;
  cat ./ignore.template > ./.npmignore;
fi
./node_modules/.bin/babel --plugins transform-react-jsx --presets es2015,react ./src/index.js -o ./index.js;
