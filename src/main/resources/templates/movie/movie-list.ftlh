
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
            align-items: flex-start;
            min-height: 100vh;
            flex-direction: column;
            animation: backgroundAnimation 15s infinite alternate;
        }

        @keyframes backgroundAnimation {
            0% {
                background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnvpullft60ife4-4oReiANP1V_u0kiiQiGA&s') no-repeat center center fixed;
                background-size: cover;
            }
            50% {
                background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnvpullft60ife4-4oReiANP1V_u0kiiQiGA&s') no-repeat center center fixed;
                background-size: cover;
            }
            100% {
                background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnvpullft60ife4-4oReiANP1V_u0kiiQiGA&s') no-repeat center center fixed;
                background-size: cover;
            }
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
            flex-grow: 1;
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
            gap: 5px;
            padding: 0;
            justify-items: center;
            color: #2d0107;

        }

        li {
            border-radius: 50%;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
            width: 280px;
            height: 280px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .movie-content {
            text-align: center;
            margin-top: 10px;
        }

        .movie-content img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 50%;
            margin: 0 auto 15px;
        }

        .movie-content p {
            font-size: 1.2rem;
            color: #fff;
            margin: 0;
        }

        li a {
            text-decoration: none;
        }

        li a:hover {
            text-decoration: none;
        }

        footer {
            text-align: center;
            font-size: 1rem;
            color: #aaa;
            margin-top: 20px;
            padding: 10px 0;
            background-color: #181818;
            width: 100%;
            position: relative;
        }

        @media (max-width: 768px) {
            ul {
                grid-template-columns: repeat(3, 1fr);
            }
        }
    </style>
</head>

<body>


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
                <a href="/movies/${movie.id}/episodes">
                    <div class="movie-content">
                        <img src="/uploads/images/${movie.imagePath!'/default-image.jpg'}" alt="${movie.title}">
                        <p>${movie.title}</p>
                    </div>
                </a>
            </li>
        </#list>
    </ul>
</main>

<footer>
    &copy; AnimeHub. All rights reserved.
</footer>

</body>
</html>
</@layout.layout>
