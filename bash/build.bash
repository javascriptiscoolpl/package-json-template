# default settings
NAME="basic-test"
DSC="this is build test"
TYPE="basic"
GITHUB="javascriptiscoolpl"
TARGET="./projects"

# main generator code
if [ "$1" == "--clean" ]; then
  if [ -d "${TARGET}" ]; then
    echo -e "Remove projects folder ${TARGET}?: (y) or (n): \c"; read ANS;
    if [ "${ANS}" == "y" ]; then
      echo -e "Removing projects folder ${TARGET} ...\c"
      rm -rf ${TARGET}
      echo "done."
    fi
  else
    echo -e "ERROR: No target directory: ${TARGET}"
  fi
  exit
fi

if [ "$1" == "--ask" ]; then
  echo -e "Please give project name: \c"; read NAME;
  echo -e "Please give project description: \c"; read DSC;
  echo -e "Please give project type: \c"; read TYPE;
  echo -e "Please give project GitHub username: \c"; read GITHUB;
  echo -e "Please give target directory for projects: \c"; read TARGET;
fi

TNAME="${TARGET}/${NAME}"
TBASH="${TNAME}/bash"
TDEMO="${TARGET}/${NAME}/demo"

echo -e "\n"
echo -e "Current settings:"
echo -e "----------------------------------------------------------------------"
printf "%-30s %s \n" "Project name:" "${NAME}"
printf "%-30s %s \n" "Project description:" "${DSC}"
printf "%-30s %s \n" "Project type:" "${TYPE}"
printf "%-30s %s \n" "Project GitHub username:" "${GITHUB}"
printf "%-30s %s \n" "Target for all projects:" "${TARGET}"
printf "%-30s %s \n" "Project root directory:" "${TNAME}"
echo -e "----------------------------------------------------------------------"
echo -e "\n"

echo -e "All fine?: (y) or (n): \c"; read ANS;
if [ "${ANS}" != "y" ]; then
  exit;
fi

echo -e "\n"

DOTS="..................................................."

MSG="Checking target directory for all projects"
echo -e ${MSG} ${DOTS:${#MSG}} "\c"
if [ ! -d "${TARGET}" ]; then
  mkdir -p "${TARGET}"
  echo -e "created: ${TARGET}"
else
  echo -e "done."
fi

MSG="Checking old project directory"
echo -e ${MSG} ${DOTS:${#MSG}} "\c"
if [ -d "${TNAME}" ]; then
  TIMESTAMP=`date +"%Y-%m-%d-%H-%M-%S"`
  mv "${TNAME}" "${TNAME}.${TIMESTAMP}"
  echo -e "old project saved at: ${TNAME}.${TIMESTAMP}"
else
  echo -e "done."
fi

MSG="Copy template folder as new project"
echo -e ${MSG} ${DOTS:${#MSG}} "\c"
if [ -d "./templates/${TYPE}" ]; then
  cp -r "./templates/${TYPE}" "${TNAME}"
  echo -e "done."
else
  echo -e "ERROR: No template directory for project type: ${TYPE}"
  exit
fi

# package.json
if [ -f "${TNAME}/package.json" ]; then
  MSG="Generating package.json"
  echo -e ${MSG} ${DOTS:${#MSG}} "\c"
  sed -i "s/PROJECT-NAME/${NAME}/g" "${TNAME}/package.json"
  sed -i "s/PROJECT-DSC/${DSC}/g" "${TNAME}/package.json"
  sed -i "s/GITHUB-USER/${GITHUB}/g" "${TNAME}/package.json"
  echo -e "done."
fi

# bash scripts
if [ -d "${TBASH}" ]; then
  MSG="Generating bash build scripts"
  echo -e ${MSG} ${DOTS:${#MSG}} "\c"
  sed -i "s/PROJECT-NAME/${NAME}/g" "${TBASH}/gitinit.bash"
  sed -i "s/GITHUB-USER/${GITHUB}/g" "${TBASH}/gitinit.bash"
  sed -i "s/GITHUB-USER/${GITHUB}/g" "${TBASH}/gitupdate.bash"
  echo -e "done."
fi

# demo package.json
if [ -f "${TDEMO}/package.json" ]; then
  MSG="Generating package.json for demo"
  echo -e ${MSG} ${DOTS:${#MSG}} "\c"
  sed -i "s/PROJECT-NAME/${NAME}/g" "${TDEMO}/package.json"
  echo -e "done."
fi

# demo import
if [ -f "${TDEMO}/src/index.js" ]; then
  MSG="Add import in demo index.js"
  echo -e ${MSG} ${DOTS:${#MSG}} "\c"
  sed -i "s/PROJECT-NAME/${NAME}/g" "${TDEMO}/src/index.js"
  echo -e "done."
fi

echo -e "\n"
echo -e "Generated project is available at: ${TNAME}"
echo -e "\n"
echo -e "NOTE: You can move this folder anywhere "
echo -e "and start coding your new project."
echo -e "\n"
