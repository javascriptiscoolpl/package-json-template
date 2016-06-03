PROJECT="https://github.com/javascriptiscoolpl/package-json-template.git"

git init;
git add .;
git commit -m \"init\";
git remote add origin "${PROJECT}";
echo -e "Username: javascriptiscoolpl";
git push -u origin master;
