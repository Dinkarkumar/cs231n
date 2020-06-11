CODE=(
        "cs231n/classifiers/k_nearest_neighbor.py"
        "cs231n/classifiers/linear_classifier.py"
        "cs231n/classifiers/linear_svm.py"
        "cs231n/classifiers/softmax.py"
        "cs231n/classifiers/neural_net.py"
)

# these notebooks should ideally
# be in order of questions so
# that the generated pdf is
# in order of questions
NOTEBOOKS=(
        "knn.ipynb"
        "svm.ipynb"
        "softmax.ipynb"
        "two_layer_net.ipynb"
        "features.ipynb"
)

FILES=( "${CODE[@]}" "${NOTEBOOKS[@]}" )

LOCAL_DIR=`pwd`
ASSIGNMENT_NO=1
ZIP_FILENAME="a1.zip"

C_R="\e[31m"
C_G="\e[32m"
C_BLD="\e[1m"
C_E="\e[0m"

for FILE in "${FILES[@]}"
do
        if [ ! -f ${FILE} ]; then
                echo -e "${C_R}Required file ${FILE} not found, Exiting.${C_E}"
                exit 0
        fi
done

echo -e "### Zipping file ###"
rm -f ${ZIP_FILENAME}
zip -q "${ZIP_FILENAME}" -r ${NOTEBOOKS[@]} $(find . -name "*.py") -x "makepdf.py"

echo -e "### Creating PDFs ###"
python makepdf.py --notebooks "${NOTEBOOKS[@]}"

echo -e "### Done! Please submit a3.zip and the pdfs to Gradescope. ###"
