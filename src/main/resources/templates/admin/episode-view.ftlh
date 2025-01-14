
<#import '../layout.ftlh' as layout>
<@layout.layout; spring>
    <head>
        <title>${episode.title}</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Inter', Arial, sans-serif;
            }

            body {
                background-color: #1c1c1c;
                color: #f5f5f5;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                text-align: center;
                padding: 1rem;
                overflow: hidden;
                position: relative;
            }

            body::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('data:image/jpeg;base64,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');
                background-size: cover;
                background-position: center;
                opacity: 0.1;
                animation: moveBackground 30s infinite linear;
            }

            @keyframes moveBackground {
                0% { background-position: 0 0; }
                100% { background-position: 100% 100%; }
            }

            h1 {
                font-size: 3rem;
                color: #ffffff;
                margin-bottom: 1rem;
                text-shadow: 0 4px 6px rgba(0, 0, 0, 0.6);
                animation: fadeIn 2s ease-in-out;
            }

            @keyframes fadeIn {
                0% { opacity: 0; }
                100% { opacity: 1; }
            }

            img {
                width: 70%;
                max-width: 400px;
                border-radius: 12px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.7);
                margin: 1.5rem 0;
                animation: scaleIn 2s ease-in-out;
            }

            @keyframes scaleIn {
                0% { transform: scale(0.8); opacity: 0; }
                100% { transform: scale(1); opacity: 1; }
            }

            video {
                width: 80%;
                max-width: 600px;
                margin: 2rem 0;
                border-radius: 8px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.7);
                animation: slideIn 2s ease-in-out;
            }

            @keyframes slideIn {
                0% { transform: translateY(20px); opacity: 0; }
                100% { transform: translateY(0); opacity: 1; }
            }

            p {
                font-size: 1.2rem;
                color: #dcdcdc;
                line-height: 1.8;
                max-width: 600px;
                margin: 2rem 0;
                animation: fadeInText 2s ease-in-out;
            }

            /* Анимация для описания */
            @keyframes fadeInText {
                0% { opacity: 0; }
                100% { opacity: 1; }
            }

            .back-button {
                display: inline-block;
                padding: 1rem 2rem;
                font-size: 1rem;
                font-weight: bold;
                color: #ffffff;
                background: linear-gradient(135deg, #ff7a18, #af002d);
                border-radius: 50px;
                text-decoration: none;
                transition: all 0.3s ease-in-out;
                margin: 1rem;
                animation: fadeInText 2s ease-in-out;
            }

            .back-button:hover {
                transform: scale(1.1);
                box-shadow: 0 6px 15px rgba(255, 122, 24, 0.6);
            }

            .next-arrow {
                margin-top: 2rem;
                font-size: 2rem;
                font-weight: bold;
                color: #ffffff;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                transition: all 0.3s ease-in-out;
            }

            .next-arrow:hover {
                color: #ff7a18;
                transform: translateX(10px);
            }

            .next-arrow span {
                margin-left: 0.5rem;
                font-size: 1.5rem;
            }
        </style>
    </head>

    <body>
    <main>
        <video controls width="800">
            <source src="/uploads/movies/${episode.filePath}" type="video/mp4">
            Ваш браузер не поддерживает просмотр видео.
        </video>
    </main>

    <footer>
        <a href="/admin/${episode.movie.id}/episodes">Назад к сериям</a>
    </footer>
</@layout.layout>

