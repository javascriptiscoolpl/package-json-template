PROJECT="https://github.com/GITHUB-USER/PROJECT-NAME.git"

git init;
git add .;
git commit -m \"init\";
git remote add origin "${PROJECT}";
echo -e "Username: GITHUB-USER";
git push -u origin master;
