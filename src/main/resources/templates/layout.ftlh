<#import "spring.ftl" as spring>
<#macro layout>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <title>Document</title>
    </head>
    <body>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background: linear-gradient(135deg, #6a1b9a, #d81b60);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .navbar-brand {
            font-size: 2rem;
            color: white;
            letter-spacing: 2px;
            text-transform: uppercase;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
        }

        .navbar-brand:hover {
            color: #f1f1f1;
        }

        .nav-link {
            color: white;
            font-weight: 500;
            margin: 0 10px;
            transition: color 0.3s ease, transform 0.2s ease;
        }

        .nav-link:hover {
            color: #ff4081;
            transform: scale(1.1);
        }

        .btn-outline-info {
            border: 2px solid #ff4081;
            color: #ff4081;
            font-weight: 600;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-outline-info:hover {
            background-color: #ff4081;
            color: white;
        }

        .btn-dark-theme {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            border-radius: 30px;
            text-transform: uppercase;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-dark-theme:hover {
            background-color: #444;
            transform: translateY(-3px);
        }

        .container {
            margin-top: 120px;
        }

        .navbar-toggler-icon {
            background-color: #fff;
        }

        /* Позиционирование кнопок на странице */
        .navbar-nav {
            margin-left: auto;
        }

        /* Для кнопки Logout */
        .logout-container {
            position: fixed;
            top: 10px;
            right: 10px;
            z-index: 10;
        }

        .btn-logout {
            background-color: #ff4081;
            color: white;
            padding: 8px 16px;
            border-radius: 50px;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-logout:hover {
            background-color: #ff80ab;
            transform: translateY(-3px);
        }

        /* Адаптивность для мобильных устройств */
        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.5rem;
            }
            .nav-link {
                font-size: 16px;
            }

            /* При мобильном разрешении кнопки могут располагаться вертикально */
            .logout-container {
                position: static;
                margin-top: 20px;
                text-align: center;
            }
        }
    </style>

    <!-- Навигационная панель -->
    <nav class="navbar navbar-expand-lg fixed-top mb-4 shadow">
        <div class="container-fluid">
            <a class="navbar-brand" href="/movies">MovieHub</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                <!-- Навигация для пользователей -->
            </div>

            <#if _csrf??>
<#--                <form action="/logout" method="post">-->
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                           value="${(_csrf.token)!'--no-token--'}"/>
<#--                    <button type="submit" class="btn btn-dark-theme m-2" id="logout">Logout</button>-->
                </form>
            <#else>
<#--                <a href="/logout" class="btn btn-dark-theme m-2" id="logout">Logout</a>-->
            </#if>

            <a href="/auth/login" class="btn btn-dark-theme m-2">Login</a>
            <a href="/auth/register" class="btn btn-dark-theme m-2">Register</a>

        </div>
    </nav>

    <!-- Основной контейнер -->
    <div class="container">
        <#nested spring>
    </div>

    </body>
    </html>
</#macro>
