<#import '../layout.ftlh' as layout>
<@layout.layout ; spring>

    <section class="d-flex justify-content-center align-items-center" style="background: linear-gradient(135deg, #400202, #6e0606); height: 100vh; padding: 0;">

        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background: linear-gradient(135deg, #400202, #6e0606);
                color: #e0d4d9;
                margin: 0;
                padding: 0;
            }

            .card {
                width: 100%;
                max-width: 500px;
                border-radius: 1.2rem;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5);
                overflow: hidden;
                border: none;
                background-color: #2e0202;
                animation: fadeIn 1s ease-out;
            }

            .card-body {
                padding: 3rem 2rem;
            }

            .form-outline {
                margin-bottom: 2rem;
                position: relative;
            }

            .form-outline .form-label {
                position: absolute;
                top: -10px;
                left: 15px;
                font-size: 1rem;
                font-weight: 600;
                color: #bfbfbf;
                transition: 0.3s ease all;
            }

            .form-control {
                border-radius: 1.5rem;
                border: 1px solid #4e0404;
                padding: 1.2rem 1.5rem;
                font-size: 1rem;
                width: 100%;
                transition: border-color 0.3s ease, box-shadow 0.3s ease;
                background-color: #500202;
                color: #e0d4d9;
            }

            .form-control:focus {
                border-color: #8e0b0b;
                box-shadow: 0 0 10px rgba(142, 11, 11, 0.8);
                background-color: #6a0202;
                outline: none;
            }

            .btn {
                border-radius: 2rem;
                padding: 0.9rem 3rem;
                font-size: 1.1rem;
                font-weight: 600;
                transition: background-color 0.3s ease, transform 0.2s;
                width: auto;
                color: #ffffff;
            }

            .btn-primary {
                background: linear-gradient(135deg, #920707, #570404);
                border: none;
            }

            .btn-primary:hover {
                background: linear-gradient(135deg, #aa1010, #750505);
                transform: translateY(-3px);
            }

            .forgot-password {
                font-size: 0.9rem;
                color: #aa1010;
                text-decoration: none;
                margin-top: 1rem;
                display: inline-block;
            }

            .forgot-password:hover {
                text-decoration: underline;
                color: #e01010;
            }

            @media (max-width: 992px) {
                .card {
                    margin: 1rem;
                }

                .card-body {
                    padding: 2rem;
                }

                .form-outline {
                    margin-bottom: 1.5rem;
                }
            }

            @keyframes fadeIn {
                0% {
                    opacity: 0;
                    transform: translateY(20px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

        </style>

        <div class="card">
            <div class="card-body">
                <h2 class="text-center mb-4" style="font-weight: 700; color: #e8d7d9;">Войти в аккаунт</h2>

                <form id="login-form" action="/auth/login" method="post">

                    <#if _csrf??>
                        <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                               value="${(_csrf.token)!'csrf-token'}"/>
                    </#if>

                    <div class="form-outline">
                        <input type="email" id="form2Example1" class="form-control" name="username" required/>
                        <label class="form-label" for="form2Example1">Email адрес</label>
                    </div>

                    <div class="form-outline">
                        <input type="password" id="form2Example2" class="form-control" name="password" required/>
                        <label class="form-label" for="form2Example2">Пароль</label>
                    </div>

                    <button type="submit" class="btn btn-primary mb-4">
                        Войти
                    </button>

                    <a href="/auth/forgot_password" class="forgot-password">Забыли пароль?</a>
                </form>
            </div>
        </div>

    </section>

</@layout.layout>
