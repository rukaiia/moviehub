
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
                background: #000000;
                color: #ddd;
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                overflow: hidden;
                font-size: 16px;
            }

            header {
                background-color: #222;
                color: #fff;
                padding: 2rem 1.5rem;
                text-align: center;
                border-bottom: 4px solid #5222ff;
            }

            h1 {
                font-size: 3rem;
                font-weight: 700;
                letter-spacing: 1px;
                text-transform: uppercase;
            }

            .container {
                max-width: 1200px;
                margin: 4rem auto;
                padding: 2.5rem;
                background: #1f1f1f;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
                overflow-y: auto;
            }

            /* Search Bar */
            .search-bar {
                display: flex;
                justify-content: space-between;
                margin-bottom: 3rem;
                gap: 1rem;
            }

            .search-bar input[type="text"] {
                flex: 1;
                padding: 1rem;
                background: #000000;
                color: #ddd;
                border: 2px solid #6122ff;
                border-radius: 10px;
                font-size: 1.1rem;
                transition: all 0.3s ease;
                outline: none;
            }

            .search-bar input[type="text"]:focus {
                background: #444;
                border-color: #6122ff;
            }

            .search-bar button {
                background: #7322ff;
                color: #fff;
                padding: 1rem 2rem;
                font-size: 1.1rem;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            .search-bar button:hover {
                background: #6536f4;
            }

            .movie-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
                gap: 2rem;
            }

            .movie-item {
                background: #333;
                padding: 1.5rem;
                border-radius: 15px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
                width: 250px;
                text-align: center;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                animation: fadeInUp 0.5s ease forwards;
                position: relative;
                overflow: hidden;
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
                font-size: 1.6rem;
                font-weight: 700;
                margin-bottom: 1rem;
                color: #fff;
            }

            .movie-item h3 a {
                color: inherit;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            .movie-item h3 a:hover {
                color: #7a22ff;
            }

            .movie-item button {
                background: #613ce7;
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

            .movie-item button:hover {
                background: #732bc0;
            }

            .upload-link {
                display: inline-block;
                margin-top: 3rem;
                padding: 1rem 2rem;
                background: #061669;
                color: white;
                text-decoration: none;
                border-radius: 10px;
                font-weight: 600;
                font-size: 1.3rem;
                text-align: center;
                transition: background 0.3s ease;
            }

            .upload-link:hover {
                background: #0a356c;
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
            <input type="text" name="query" placeholder="Search by title or genre" value="${query!}"/>
            <button type="submit">Search</button>
        </form>

        <div class="movie-list">
            <#list movies as movie>
                <div class="movie-item">
                    <h3><a href="/admin/${movie.id}">${movie.title}</a></h3>

                    <img src="/uploads/images/${movie.imagePath!'/default-image.jpg'}" alt="${movie.title}">
                    <form action="/admin/delete/${movie.id}" method="post">
                        <#if _csrf??>
                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                        </#if>
                        <button type="submit">Delete</button>
                    </form>
                </div>
            </#list>
        </div>

        <a href="/admin/upload" class="upload-link">Upload New Movie</a>
    </div>
    </body>

</@layout.layout>
