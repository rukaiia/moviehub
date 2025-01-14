
<#import '../layout.ftlh' as layout>
<@layout.layout; spring>

    <head>
        <title>Movies Admin Panel</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: #1a1a1a;
                color: #ddd;
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
                font-size: 16px;
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
                background-color: rgba(0, 0, 0, 0.8);
                color: #fff;
                padding: 2rem 1.5rem;
                text-align: center;
                border-bottom: 4px solid rgba(75, 3, 4, 0.33);
            }

            h1 {
                font-size: 3rem;
                font-weight: 700;
                letter-spacing: 1px;
                text-transform: uppercase;
                text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
            }

            .container {
                max-width: 1200px;
                margin: 4rem auto;
                padding: 2.5rem;
                background: rgba(0, 0, 0, 0.85);
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.6);
                overflow-y: auto;
                backdrop-filter: blur(10px);
            }

            .search-bar {
                display: flex;
                justify-content: space-between;
                margin-bottom: 3rem;
                gap: 1rem;
            }

            .search-bar input[type="text"] {
                flex: 1;
                padding: 1rem;
                background: #333;
                color: #ddd;
                border: 2px solid #520707;
                border-radius: 10px;
                font-size: 1.1rem;
                transition: all 0.3s ease;
                outline: none;
            }

            .search-bar input[type="text"]:focus {
                background: #000000;
                border-color: rgba(89, 2, 5, 0.33);
            }

            .search-bar button {
                background: rgba(93, 7, 37, 0.33);
                color: #fff;
                padding: 1rem 2rem;
                font-size: 1.1rem;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            .search-bar button:hover {
                background: #59081e;
            }

            .movie-list {
                display: flex;
                flex-wrap: wrap;
                gap: 2rem;
                justify-content: center;
                animation: fadeIn 1s ease-in-out;
            }

            .movie-item {
                background: rgba(0, 0, 0, 0.7);
                padding: 1.5rem;
                border-radius: 15px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
                text-align: center;
                width: 250px;
                height: 400px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                position: relative;
                overflow: hidden;
                cursor: pointer;
                animation: fadeInUp 0.5s ease forwards;
            }

            .movie-item img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 8px;
                margin-bottom: 1rem;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                transition: transform 0.3s ease;
            }

            .movie-item h3 {
                font-size: 1.4rem;
                font-weight: 700;
                margin-bottom: 1rem;
                color: #fff;
                text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
                height: 50px;
                overflow: hidden;
            }

            .movie-item button {
                background: #440223;
                color: #fff;
                padding: 0.8rem 1.5rem;
                font-size: 1.1rem;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                transition: background 0.3s ease;
                position: absolute;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                width: 90%;
            }

            .movie-item a {
                display: inline-block;
                margin-bottom: 1rem;
                color: #ddd;
                text-decoration: none;
                font-weight: 600;
            }

            .movie-item a:hover {
                color: #440617;
            }


            .movie-item form {
                margin-top: 1rem;
                position: relative;
            }

            .movie-item button {
                background: #440223;
                color: #fff;
                padding: 0.8rem 1.5rem;
                font-size: 1.1rem;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                transition: background 0.3s ease;
                width: 100%;
                margin-top: 1rem;
            }

            .movie-item button:hover {
                background: #330314;
            }

            .upload-link {
                display: inline-block;
                margin-top: 3rem;
                padding: 1rem 2rem;
                background: #2d0107;
                color: white;
                text-decoration: none;
                border-radius: 10px;
                font-weight: 600;
                font-size: 1.3rem;
                text-align: center;
                transition: background 0.3s ease;
            }

            .upload-link:hover {
                background: #560422;
            }

            @keyframes fadeIn {
                0% {
                    opacity: 0;
                }
                100% {
                    opacity: 1;
                }
            }

            @keyframes fadeInUp {
                0% {
                    opacity: 0;
                    transform: translateY(50px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @media (max-width: 768px) {
                .container {
                    padding: 2rem;
                }

                .search-bar {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .search-bar input[type="text"] {
                    margin-bottom: 1rem;
                    width: 100%;
                }

                .search-bar button {
                    width: 100%;
                    padding: 1rem;
                }

                .movie-list {
                    flex-direction: column;
                    align-items: center;
                }

                .movie-item {
                    width: 80%;
                    margin-bottom: 2rem;
                }

                .movie-item img {
                    height: 150px;
                }
            }
        </style>
    </head>

    <body>
    <header>
        <h1>Movies Admin Panel</h1>
    </header>

    <div class="container">
        <form action="/admin/search" method="get" class="search-bar">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <input type="text" name="query" placeholder="Search movies by title or genre" value="${query!}"/>
            <button type="submit">Search</button>
        </form>

        <div class="movie-list">
            <#list movies as movie>
                <div class="movie-item">
                    <h3>${movie.title}</h3>
                    <a href="/admin/movies/${movie.id}/episodes">
                        <img src="/uploads/images/${movie.imagePath!'/default-image.jpg'}" alt="${movie.title}">
                    </a>


                    <form action="/admin/delete/${movie.id}" method="post">
                        <#if _csrf??>
                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                        </#if>
                        <button type="submit">Delete</button>
                    </form>
                </div>
            </#list>
        </div>
    </div>

    <a href="/admin/upload" class="upload-link">Upload New Movie</a>
    </div>
    </body>

</@layout.layout>


