# Medods Intern Test Task

![Static Badge](https://img.shields.io/badge/ruby-v3.0.2-brown)
![Static Badge](https://img.shields.io/badge/rails-v7.1.0-orange)
![Static Badge](https://img.shields.io/badge/pg-v1.5.4-green)   
![Static Badge](https://img.shields.io/badge/puma-v5.0-blue)

## :sparkles: Описание проекта
Микросервис на позволяющий пациентам отправлять запросы на консультацию с медицинскими специалистами и получать рекомендации. 

А также реализована возможность получать и анализировать медицинские данные (моковые), полученные из внешних API: Аdviceslip и Faker.

Кроме обязательного функционала, был реализован функционал оповещения о новых рекомендациях по электронной почте пациента. Написан DockerFile
___

## :clipboard: Использование
Для первого запуска приложения через make-файл в докере с инициализацие бд и миграцией:
```
make init
```
Для запуска приложения через make-файл в докере:
```
make run
```
___

## :pushpin: REST Endpoints

### PATIENTS
Эндпоинт для регистрации новых пользователей (пациентов)
##### POST - /patients/
Example Input:
```
{
    "patient": {
        "name": "Sasha",
        "surname": "Shaturniy",
        "patronymic": "Evgenievich", 
        "birth_date": "10.03.2002",
        "phone": "89627423882", 
        "email": "shaturnyyy@mail.ru"
    }
}
```
Example Response:
```
{
    "patient_id": 1
}
```

### CONSULTATION REQUESTS
Эндпоинт позволяющий пациенту создать запрос на косультацию

##### POST - /consultation_requests
Example Input:
```
{
    "consultation_request": {
        "request_text": "Головная боль",
        "request_date": "10.10.2022",
        "patient_id": 1
    }
}
```
Example Response:
```
{
    "consultation_request_id": 1
}
```

### RECOMMENDATIONS
Группа эндпоинтов для создания рекомендаций к существующим запросам на консультации и получение списка всех рекомендаций для конкретного пользователя
##### POST - /consultation_requests/:request_id/recommendations
Example Input:
```
{
    "recommendation": {
        "recommendation_text": "Больше отдыхать!"
    }
}
```
Example Response:
```
{
    "recommendation_id": 1
}
```
##### GET - /patients/1/recommendations
Example Response:
```
{
    "recommendations": [
        {
            "id": 1,
            "recommend_text": "Больше отдыхать!",
            "consultation_request_id": 1,
            "created_at": "2023-10-11T18:26:13.235Z",
            "updated_at": "2023-10-11T18:26:13.235Z"
        }
    ]
}
```
### THIRD PARTY API endpoints
Группа эндпоинтов для получения данных пациента и их анализа (моковые данные).
##### GET - /mock_data/
Example Response:
```
{
    "data": "I wish I could go with you."
}
```
##### GET - /mock_data/analysis
Example Response:
```
{
    "analysis": "A long walk alone with some time to think, can work wonders."
}
```
