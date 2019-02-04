#人的力量是有限的
#我不作人啦
#凡未完结的小说，留一个id在这里


#DEBUG
set -xeuo -pipefail

#设置id和文件名
#文件名不可有空格
function book-source {
cat <<EOF 
4106114562 机器人与人与图灵测试.epub
EOF
}

function count {
echo $#
}

function fetch-book {
cd ebook/
IFS=$(echo -e "\n")
for i in $(book-source); do
	id=$(awk '{print $1}' <<<"$i")
	book_name=$(awk '{print $2}' <<<"$i")
	tieba-to-epub $id $book_name
done
}

DIR=$(basename $PWD)
[ "$DIR" = Canoe ]&&eval "fetch-book"