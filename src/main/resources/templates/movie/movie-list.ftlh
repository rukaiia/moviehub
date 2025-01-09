
<#import '../layout.ftlh' as layout>
<@layout.layout; spring>

    <head>
        <title>Movies Collection</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #121212;
                color: #e0e0e0;
                line-height: 1.6;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                flex-direction: column;
            }

            header {
                background-color: #181818;
                width: 100%;
                text-align: center;
                padding: 20px;
                border-bottom: 2px solid #444;
                position: absolute;
                top: 0;
                left: 0;
            }

            header h1 {
                font-size: 3rem;
                font-weight: 700;
                color: #fff;
                letter-spacing: 2px;
                margin: 0;
            }

            main {
                padding: 40px;
                width: 100%;
                max-width: 1200px;
                margin-top: 80px;
                text-align: center;
            }

            form {
                display: flex;
                justify-content: center;
                margin-bottom: 40px;
            }

            input[type="text"] {
                padding: 15px 20px;
                font-size: 1.2rem;
                border: 2px solid #444;
                background-color: #181818;
                color: #e0e0e0;
                border-radius: 8px;
                width: 50%;
                transition: border-color 0.3s ease, transform 0.3s ease;
            }

            input[type="text"]:focus {
                border-color: #aaa;
                transform: scale(1.05);
            }

            button {
                padding: 15px 30px;
                font-size: 1.2rem;
                background-color: #444;
                color: #fff;
                border: none;
                border-radius: 8px;
                margin-left: 20px;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            button:hover {
                background-color: #666;
                transform: scale(1.05);
            }

            ul {
                list-style: none;
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 30px;
                padding: 0;
                justify-items: center;
            }

            li {
                background-color: #1c1c1c;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
                width: 100%;
                max-height: 350px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            li:hover {
                transform: translateY(-8px);
                box-shadow: 0 16px 32px rgba(0, 0, 0, 0.6);
            }

            li img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }

            li a {
                display: block;
                padding: 15px;
                font-size: 1.4rem;
                color: #fff;
                text-decoration: none;
                font-weight: bold;
                background-color: #2c2c2c;
                text-align: center;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            li a:hover {
                background-color: #444;
                color: #aaa;
            }

            @media (max-width: 768px) {
                input[type="text"] {
                    width: 80%;
                }

                button {
                    width: 40%;
                }

                ul {
                    grid-template-columns: 1fr 1fr;
                }
            }

            footer {
                text-align: center;
                font-size: 1rem;
                color: #aaa;
                margin-top: 40px;
                padding: 20px 0;
                background-color: #181818;
                position: fixed;
                bottom: 0;
                width: 100%;
            }
        </style>
    </head>

    <body>
    <header>
        <h1>Movies Collection</h1>
    </header>

    <main>
        <form action="/movies/search" method="get">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <input type="text" name="query" placeholder="Search by title or genre" value="${query!""}">
            <button type="submit">Search</button>
        </form>

        <ul>
            <#list movies as movie>
                <li>
                    <img src="/uploads/images/${movie.imagePath!'/default-image.jpg'}" alt="${movie.title}">
                    <a href="/movies/${movie.id}">${movie.title}</a>
                </li>
            </#list>
        </ul>
    </main>

    <footer>
        &copy; MovieHub. All rights reserved.
    </footer>

    </body>
    </html>
</@layout.layout>
