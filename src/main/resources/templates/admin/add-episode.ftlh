<#import '../layout.ftlh' as layout>

<@layout.layout; spring>
    <head>
        <title>Add Episode</title>
        <style>
            html, body {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                font-family: 'Inter', sans-serif;
                background-color: #121212;
                color: #e0e0e0;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin-left: 400px;
                margin-top: 0;
            }

            .form-container {
                width: 100%;
                max-width: 500px;
                background: #1f1f1f;
                border-radius: 16px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
                padding: 24px;
                text-align: center;
            }

            .form-container h1 {
                font-size: 22px;
                font-weight: 600;
                color: #ff5555;
                margin-bottom: 16px;
            }

            label {
                font-size: 14px;
                color: #e0e0e0;
                display: block;
                text-align: left;
                margin-bottom: 8px;
                margin-top: 16px;
            }

            input[type="text"],
            input[type="file"] {
                width: 100%;
                padding: 12px 16px;
                margin-top: 4px;
                border: none;
                border-radius: 8px;
                background: #2a2a2a;
                color: #e0e0e0;
                font-size: 14px;
                outline: none;
                transition: background-color 0.3s, box-shadow 0.3s;
            }

            input[type="text"]:focus,
            input[type="file"]:focus {
                background: #333;
                box-shadow: 0 0 8px rgba(255, 85, 85, 0.5);
            }

            button {
                width: 100%;
                padding: 12px;
                border: none;
                border-radius: 8px;
                background: linear-gradient(45deg, #ff5555, #ff6b6b);
                color: white;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                margin-top: 24px;
                transition: transform 0.2s, box-shadow 0.3s;
            }

            button:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(255, 85, 85, 0.4);
            }

            a {
                display: inline-block;
                margin-top: 16px;
                font-size: 14px;
                color: #ff6b6b;
                text-decoration: none;
                transition: color 0.3s;
            }

            a:hover {
                color: #ff8787;
            }

            input[type="file"]::file-selector-button {
                padding: 8px 16px;
                border: none;
                border-radius: 8px;
                background: #ff5555;
                color: #fff;
                font-weight: 600;
                cursor: pointer;
                transition: background 0.3s;
            }

            input[type="file"]::file-selector-button:hover {
                background: #ff6b6b;
            }
        </style>
    </head>
    <body>
    <div class="form-container">
        <h1>Add Episode for Movie: ${movieTitle}</h1> <!-- Заменили movieId на movieTitle -->
        <form action="/admin/${movieId}/episodes/add" method="post" enctype="multipart/form-data">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                       value="${(_csrf.token)!'csrf-token'}"/>
            </#if>

            <label for="title">Episode Title:</label>
            <input type="text" name="title" id="title" placeholder="Enter episode title" required>

            <label for="file">Episode Video:</label>
            <input type="file" name="file" id="file" accept="video/*" required>

            <button type="submit">Add Episode</button>
        </form>
        <a href="/admin/movies/${movieId}/episodes">Back to Episodes</a>
    </div>
    </body>
</@layout.layout>
