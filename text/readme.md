terraform -chdir="./modules/storage" init
terraform -chdir="./modules/user db" init
1. Определить дефолтные переменные tf and node
2. Сделать переменные на уровне azure devops tf and node
3. Попробовать создать пользователя (dynamic) postgres, если нет - модуль
3.1. провайдер 
3.2. пользователь
3.3. тест позьвателей
3.4. автоматизация 
4. npm ci
5. terraform.tfstate.backup - ?


- 1. - 3.1 -3.2 -3.3.  -3ч
+ 2. - 4.              -4ч - 30m
3. - 1.  - 1ч 
4. - 2.  - 3ч
5. - 5.  - 2ч
6. - 3.4  - 5ч