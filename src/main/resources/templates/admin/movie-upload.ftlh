<#import '../layout.ftlh' as layout>
<@layout.layout; spring>
    <head>
        <title>Upload Movie</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #121212;
                color: #e0e0e0;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                text-align: center;
            }

            h1 {
                text-align: center;
                color: #fff;
                font-size: 2.5rem;
                margin-bottom: 30px;
            }

            .form-container {
                background-color: #1f1f1f;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
                max-width: 600px;
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                margin: 0 auto;
            }

            .form-container label {
                font-size: 1.1rem;
                color: #ccc;
                display: block;
                margin-bottom: 8px;
            }

            .form-container input,
            .form-container textarea,
            .form-container button {
                width: 100%;
                padding: 12px;
                margin-bottom: 20px;
                border: 2px solid #444;
                background-color: #2a2a2a;
                color: #e0e0e0;
                border-radius: 8px;
                font-size: 1rem;
                transition: all 0.3s ease;
            }

            .form-container input[type="file"] {
                border: none;
                padding: 10px;
            }

            .form-container input:focus,
            .form-container textarea:focus,
            .form-container button:hover {
                border-color: #4caf50;
                background-color: #333;
                transform: scale(1.03);
            }

            .form-container button {
                background-color: #4caf50;
                color: white;
                font-weight: bold;
                cursor: pointer;
            }

            .form-container button:hover {
                background-color: #45a049;
            }

            .form-container textarea {
                resize: vertical;
            }

            .form-container input::placeholder,
            .form-container textarea::placeholder {
                color: #888;
            }

            .form-container .csrf-input {
                display: none;
            }

            @media (max-width: 768px) {
                .form-container {
                    padding: 20px;
                }

                .form-container input,
                .form-container textarea,
                .form-container button {
                    font-size: 0.9rem;
                }
            }
        </style>
    </head>

    <body>
    <div class="form-container">
        <h1>Upload Movie</h1>
        <form action="/admin/upload" method="post" enctype="multipart/form-data">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}" class="csrf-input"/>
            </#if>

            <label for="title">Title:</label>
            <input type="text" name="title" id="title" placeholder="Enter movie title" required><br>

            <label for="description">Description:</label>
            <textarea name="description" id="description" placeholder="Enter movie description" rows="4" required></textarea><br>

            <label for="genre">Genre:</label>
            <input type="text" name="genre" id="genre" placeholder="Enter movie genre" required><br>

            <label for="file">Video File:</label>
            <input type="file" name="file" id="file" accept="video/*" required><br>

            <label for="image">Image File:</label>
            <input type="file" name="image" id="image" accept="image/*" required><br>

            <button type="submit">Upload</button>
        </form>
    </div>
    </body>
    </html>
</@layout.layout>


