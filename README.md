# blog
blog
# 使用pip  freeze生成项目依赖包
pip freeze > D:\pycharm\requirements.txt

# 使用 pipreqs 生成
我们还可以通过第三方库 pipreqs 来生成 requirements.txt 文件，这个方式有一个好处，那就是它可以只生成我们当前Python项目中所用到的依赖包及其版本号，而不是像 pip freeze 方式一样把所有包全部列出生成。
pip install pipreqs

pipreqs 使用起来也很容易，命令使用方式为：pipreqs 当前Python项目的根目录

例如：
pipreqs D:\pycharm\Code\flaskDemo