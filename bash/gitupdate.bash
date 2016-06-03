echo -e "--------------------- STATUS ---------------------";
git status;
echo -e "Please add commit message: \c"; read MSG;
echo -e "--------------------- ADD ------------------------";
git add .;
echo -e "--------------------- COMMIT ---------------------";
git commit -m "${MSG}";
echo -e "--------------------- STATUS ---------------------";
git status;
echo -e "--------------------------------------------------";
echo -e "All fine? Submit?: (y) or (n): \c"; read ANS;
if [ "${ANS}" == "y" ]; then
  echo -e "--------------------- PUSH -----------------------";
  echo -e "Username: javascriptiscoolpl";
  git push;
fi
