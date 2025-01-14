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
                max-width: 800px;
                margin: 50px auto;
                padding: 20px;
                text-align: center;
            }
            h1 {
                font-size: 2.5rem;
                color: #ff414d;
                margin-bottom: 20px;
            }
            ul {
                list-style-type: none;
                padding: 0;
            }
            li {
                margin: 10px 0;
                font-size: 1.2rem;
                font-weight: bold;
            }
            li a {
                padding: 10px 15px;
                border: 1px solid #ff414d;
                border-radius: 5px;
                background: #1e1e1e;
                display: inline-block;
                transition: all 0.3s ease;
            }
            li a:hover {
                background: #ff414d;
                color: #121212;
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
        <h1>Episodes for Movie ID: ${movieId}</h1>
        <ul>
            <#if episodes?size gt 0>
                <#list episodes as episode>
                    <li>
                        <a href="/admin/episodes/${episode.id}">
                            ${episode.title}
                        </a>
                    </li>
                </#list>
            <#else>
                <p>No episodes available for this movie.</p>
            </#if>
        </ul>

        <div class="button-group">
            <a href="/admin/movies/${movieId}/episodes/add">Add New Episode</a>
            <a href="/admin">Back to Movies</a>
        </div>
    </div>
    </body>
</@layout.layout>

