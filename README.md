# devops_final_project
Требования перед запуском:
Для развертывания проекта необходимо 4 машины:
 - Машина Админа, с которой будет происходить конфигурация остальных (не участвует в развертывании кластера и приложения)
  -- Установлен Ansible + ssh Сервер
 - Master-node - на которой будет располагаться соответсвующая часть кластера Kubernetes
  -- Установлен Python3 + ssh Сервер
 - Две worker-node, на которых будет располагаться база данных и веб приложение соовтественно
  -- Установлен Python3 + ssh Сервер
 
  -- Все машины должны быть связаны по ssh при помощи токенов.

Последовательность развертывания проекта:
1.