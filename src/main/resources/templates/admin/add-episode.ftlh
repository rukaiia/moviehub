<#import '../layout.ftlh' as layout>

<@layout.layout; spring>
    <head>
        <title>Add Episode</title>
    </head>
    <body>
    <div class="form-container">
        <h1>Add Episode for Movie ID: ${movieId}</h1>
        <form action="/admin/${movieId}/episodes/add" method="post" enctype="multipart/form-data">

            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                       value="${(_csrf.token)!'csrf-token'}"/>
            </#if>
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <label for="title">Title:</label>
            <input type="text" name="title" id="title" placeholder="Enter episode title" required>

<#--            <label for="description">Description:</label>-->
<#--            <textarea name="description" id="description" placeholder="Enter episode description" rows="4" required></textarea>-->

            <label for="file">Episode Video:</label>
            <input type="file" name="file" id="file" accept="video/*" required>

<#--            <label for="image">Episode Image:</label>-->
<#--            <input type="file" name="image" id="image" accept="image/*" required>-->

            <button type="submit">Add Episode</button>

            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                       value="${(_csrf.token)!'csrf-token'}"/>
            </#if>
        </form>
        <a href="/admin/movies/${movieId}/episodes">Back to Episodes</a>

    </div>
    </body>
</@layout.layout>