import os
import json
import shutil
import requests
from typing import NamedTuple, Dict, List
from pypinyin import pinyin, lazy_pinyin, Style
from PIL import Image

class Student(NamedTuple):
    id: int
    name_zhcn: str
    name_en: str
    avatar_path: str
    
    def __str__(self):
        return f'{self.id} {self.name_zhcn} {self.name_en}'

# # 执行 git clone
# if os.path.exists('SchaleDB'):
#     os.system('cd SchaleDB && git pull')
# else:
#     os.system('git clone https://github.com/lonqie/SchaleDB.git --depth=1')
# json_data = None

repo_root = r'C:/Users/ZhouXiaokang/Downloads/SchaleDB-main'
with open(repo_root + '/data/cn/students.json', 'r', encoding='utf-8') as f:
    data_cn = json.load(f)
with open(repo_root + '/data/en/students.json', 'r', encoding='utf-8') as f:
    data_en = json.load(f)

# 提取所有学生的中英文名称，以及图片路径
students: Dict[int, Student] = {}
for student in data_cn:
    id = student['Id']
    name = student['Name'].replace('（', '(').replace('）', ')')
    avatar_path = f'{repo_root}/images/student/collection/{id}.webp'
    # print(id, name, avatar_path)
    students[id] = Student(id, name, '', avatar_path)
for student in data_en:
    id = student['Id']
    name = student['Name']
    students[id] = students[id]._replace(name_en=name)


typst_templ = ''
markdown = open('docs/students.md', 'w+', encoding='utf-8')
typst = open('momotalk/characters.typ', 'w+', encoding='utf-8')
with open('momotalk/__characters_templ.typ', 'r', encoding='utf-8') as f:
    typst_templ = f.read()
markdown.write('<!-- AUTO GENERATED, DO NOT EDIT -->\n')
markdown.write('| 中文名 | 英文变量名 | 中文变量名 | 拼音变量名 |\n')
markdown.write('| :---: |  :---:   |   :---:  | :---: |\n')
typst.write('// ---------- AUTO GENERATED, DO NOT EDIT ----------\n')
typst.write(typst_templ)

# 先清空图片
if os.path.exists('momotalk/assets/students'):
    shutil.rmtree('momotalk/assets/students')
os.mkdir('momotalk/assets/students')
for student in students.values():
    var_en = student.name_en.replace(' ', '_').replace('(', '').replace(')', '').lower()
    var_zhcn = student.name_zhcn.replace(' ', '').replace('(', '').replace(')', '')
    var_pinyin = ''.join(lazy_pinyin(var_zhcn, style=Style.NORMAL))
    
    print(var_en, var_zhcn, var_pinyin)
    # 转换图片格式
    target_path = f'momotalk/assets/students/{var_en}.png'
    if os.path.exists(student.avatar_path):
        avatar = Image.open(student.avatar_path)
        avatar.save(target_path)
    # 生成代码
    typst_code = f'''
#let {var_en} = messages.with("{student.name_zhcn}", "/{target_path}")
#let {var_pinyin} = {var_en}
#let {var_zhcn} = {var_en}
'''
    typst.write(typst_code)
    # 生成 Markdown 表格
    markdown.write(f'| {student.name_zhcn} | `{var_en}` | `{var_zhcn}` | `{var_pinyin}` |\n')

typst.write('// ---------- AUTO GENERATED, DO NOT EDIT ----------\n')
markdown.write('<!-- AUTO GENERATED, DO NOT EDIT -->\n')
typst.close()
markdown.close()