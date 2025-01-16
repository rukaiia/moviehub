<#import '../layout.ftlh' as layout>

<@layout.layout ; spring>
    <div class="container h-100 m-3">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-8 col-lg-10">
                <h1 class="text-danger mb-4 text-center">Регистрация</h1>
                <div class="card shadow-lg bg-dark" style="border-radius: 15px; overflow: hidden;">
                    <div class="card-header text-center" style="background: linear-gradient(135deg, #2d3436, #c0392b); color: white;">
                        <h2 class="my-3">Создайте аккаунт</h2>
                    </div>
                    <div class="card-body bg-dark">
                        <form action="/auth/register" method="post">

                            <#if _csrf??>
                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                       value="${(_csrf.token)!'--no-token--'}"/>
                            </#if>

                            <!-- Email Field -->
                            <div class="row align-items-center mb-4">
                                <div class="col-md-3 text-md-end text-center">
                                    <h6 class="mb-0 text-danger">Email</h6>
                                </div>
                                <div class="col-md-8">
                                    <@spring.formInput path="userDto.email" attributes="id='form3Example3cg' class='form-control form-control-lg bg-dark text-danger border-danger shadow-sm'" />
                                    <@spring.showErrors "<br>" "error text-danger" />
                                </div>
                            </div>

                            <!-- Password Field -->
                            <div class="row align-items-center mb-4">
                                <div class="col-md-3 text-md-end text-center">
                                    <h6 class="mb-0 text-danger">Пароль</h6>
                                </div>
                                <div class="col-md-8">
                                    <@spring.formInput path="userDto.password" attributes="id='form3Example4cg' class='form-control form-control-lg bg-dark text-danger border-danger shadow-sm'" />
                                    <@spring.showErrors "<br>" "error text-danger" />
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-danger btn-lg px-5" style="border-radius: 30px; background: #c0392b; border: none; transition: background-color 0.3s ease, transform 0.3s ease;">
                                    Зарегистрироваться
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        body {
            background-color: #2d3436;
            font-family: 'Segoe UI', sans-serif;
            color: #dfe6e9;
            margin: 0;
            padding: 0;
        }

        .card {
            border: none;
        }

        .card-header {
            background: linear-gradient(135deg, #2d3436, #c0392b);
            color: #fff;
            transition: all 0.3s ease;
        }

        .card-header:hover {
            background: linear-gradient(135deg, #c0392b, #e74c3c);
            transform: scale(1.05);
        }

        .card-body {
            background-color: #1e272e;
            color: #dfe6e9;
            border-radius: 0 0 15px 15px;
        }

        .form-control {
            background-color: #1e272e;
            color: #dfe6e9;
            border: 1px solid #c0392b;
            border-radius: 8px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #e74c3c;
            box-shadow: 0 0 8px rgba(231, 76, 60, 0.5);
            outline: none;
        }

        .btn-danger {
            background-color: #c0392b;
            border: none;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 30px;
            border-radius: 30px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #e74c3c;
            transform: translateY(-3px);
        }

        .container {
            animation: fadeIn 0.7s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @media (max-width: 768px) {
            .col-xl-8, .col-lg-10 {
                width: 100%;
            }

            .btn-danger {
                font-size: 16px;
                padding: 8px 25px;
            }
        }
    </style>
</@layout.layout>
