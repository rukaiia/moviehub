<#import '../layout.ftlh' as layout>
<@layout.layout; spring>
    <head>
        <title>${movie.title}</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Arial', sans-serif;
            }

            body {
                background-color: #f0f0f0;
                color: #333;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                padding: 2rem;
                margin: 0;
            }

            .movie-container {
                background-color: #fff;
                width: 100%;
                max-width: 900px;
                padding: 2rem;
                border-radius: 15px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                text-align: center;
                overflow: hidden;
            }

            h1 {
                font-size: 2.5rem;
                font-weight: bold;
                color: #222;
                margin-bottom: 1.5rem;
            }

            img {
                width: 80%;
                max-width: 600px;
                height: auto;
                border-radius: 8px;
                margin-bottom: 1.5rem;
            }

            p {
                font-size: 1.2rem;
                color: #555;
                line-height: 1.8;
                margin-bottom: 2rem;
            }

            video {
                width: 100%;
                height: auto;
                border-radius: 8px;
                margin-bottom: 2rem;
            }

            .back-button {
                display: inline-block;
                padding: 1rem 2rem;
                background-color: #007bff;
                color: #fff;
                font-size: 1.2rem;
                font-weight: bold;
                text-decoration: none;
                border-radius: 8px;
                text-transform: uppercase;
                letter-spacing: 1px;
                margin-top: 2rem;
            }

            .back-button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>

    <body>
    <div class="movie-container">
        <h1>${movie.title}</h1>
        <img src="/uploads/images/${movie.imagePath!'/default-image.jpg'}" alt="${movie.title}">
        <p>${movie.description}</p>

        <video controls>
            <source src="/uploads/movies/${movie.filePath}" type="video/mp4" />
            Ваш браузер не поддерживает тег video.
        </video>

        <a href="/movies" class="back-button">Back to list</a>
    </div>
    </body>

</@layout.layout>



