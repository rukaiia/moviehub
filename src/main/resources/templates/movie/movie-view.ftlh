
<#import '../layout.ftlh' as layout>
<@layout.layout ; spring>
    <head>
        <title>${movie.title}</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f9f9f9;
                color: #333;
                line-height: 1.6;
            }
            header {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                text-align: center;
            }
            header h1 {
                margin: 0;
                font-size: 1.8rem;
            }
            main {
                padding: 20px;
            }
            h1 {
                font-size: 1.6rem;
                color: #4CAF50;
            }
            p {
                margin: 20px 0;
                font-size: 1rem;
            }
            video {
                width: 100%;
                height: auto;
                margin: 20px 0;
                border: 2px solid #ddd;
                border-radius: 4px;
            }
            a {
                display: inline-block;
                margin-top: 20px;
                text-decoration: none;
                color: #fff;
                background-color: #4CAF50;
                padding: 10px 15px;
                border-radius: 4px;
                transition: background 0.3s ease;
            }
            a:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
    <h1>${movie.title}</h1>
    <img src="/uploads/images/${movie.imagePath!'/default-image.jpg'}" alt="${movie.title}"
         style="width: 150px; height: auto; border-radius: 8px;">
    <p>${movie.description}</p>
    <video controls style="width: 100%; max-width: 800px;">
        <source src="/uploads/movies/${movie.filePath}" type="video/mp4">
        Ваш браузер не поддерживает видео.
    </video>
    <a href="/movies">Back to list</a>
    </body>

    </html>
</@layout.layout>



