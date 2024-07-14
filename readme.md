# Набор скриптов для установки Arch Linux

- set_var - устанавливает переменные для установки  
  __Начать лучше с этого файла__  
  скрипт создает файл `VARIABLE` с переменными:
  
  - название диска для установки
  - имя хоста
  - имя пользователя
  - дополнительные пакеты для установки

- parts_disk  - размечает диск для установки

- arch_base   - установка основных пакетов Arch Linux

- locale_ru   - установка локали и подержка русского языка

- user_add    - добавлениe имени хоста и дополнительных пользователей

- grub2_inst  - установка загрузчика GRUB2

### Дополнения, ставить на установленный Arch

- soft_inst - установка дополнительных пакетов и программ
- aur_inst - установка AUR репозитария  
  (для установки пакетов команда yay, пример: `yay -S timeshift`)
- wifi_set - установка wifi
- blth_set - установка bluetooth

[Документация по markdown](https://docs.github.com/ru/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#links)
