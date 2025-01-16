
<#import '../layout.ftlh' as layout>
<@layout.layout; spring>
    <head>
        <title>Episodes</title>
        <style>
            body {
                margin: 0;
                font-family: 'Arial', sans-serif;
                background-color: #121212;
                color: #ffffff;

            }

            a {
                text-decoration: none;
                color: #ff414d;
                transition: color 0.3s ease;
            }
            a:hover {
                color: #ff737b;
            }
            .form-container {
                max-width: 900px;
                margin: 50px auto;
                padding: 20px;
                text-align: center;
            }
            h1 {
                font-size: 2.5rem;
                color: #ff414d;
                margin-bottom: 10px;
            }
            h2 {
                font-size: 1.2rem;
                color: #cccccc;
                margin-bottom: 30px;
            }
            img {
                margin-bottom: 20px;
                max-width: 100%;
                height: auto;
                border-radius: 10px;
            }
            .episodes-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 15px;
                margin-top: 20px;
            }
            .episode-card {
                background: #1e1e1e;
                border: 1px solid #ff414d;
                border-radius: 10px;
                padding: 15px;
                text-align: center;
                width: 150px;
                transition: all 0.3s ease;
            }
            .episode-card a {
                display: block;
                font-size: 1rem;
                font-weight: bold;
                color: #ffffff;
            }
            .episode-card:hover {
                background: #ff414d;
                color: #121212;
                transform: translateY(-5px);
            }
            .button-group {
                margin-top: 30px;
            }
            .button-group a {
                display: inline-block;
                margin: 15px 10px;
                padding: 10px 20px;
                font-size: 1rem;
                font-weight: bold;
                color: #121212;
                background: #ff414d;
                border-radius: 5px;
                transition: background 0.3s ease;
            }
            .button-group a:hover {
                background: #ff737b;
                color: #ffffff;
            }
        </style>
    </head>
    <body>
    <div class="form-container">
        <h1>${movieTitle}</h1>
        <img src="/uploads/images/${movie.imagePath!'/default-image.jpg'}" alt="${movie.title}">
        <h2>${movieDescription}</h2>


        <div class="episodes-container">
            <#if episodes?size gt 0>
                <#list episodes as episode>
                    <div class="episode-card">
                        <a href="/movies/episodes/${episode.id}">
                            ${episode.title}
                        </a>
                    </div>
                </#list>
            <#else>
                <p>No episodes available for this movie.</p>
            </#if>
        </div>

        <div class="button-group">
            <a href="/movies">Back to Movies</a>
        </div>
    </div>
    </body>
</@layout.layout>
